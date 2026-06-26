import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/auth/data/models/auth_response_model.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import '../../utils/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._dio);

  final Dio _dio;
  static Completer<String?>? _refreshCompleter;

  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    final bool isAuthPath = options.path.contains('auth/');
    final bool isRefresh = options.extra['isRefreshRequest'] == true;

    if (isAuthPath && !isRefresh) {
      return handler.next(options);
    }

    if (isRefresh) {
      final String? refreshToken = await TokenStorage.getRefreshToken();
      if (refreshToken != null) {
        options.headers['Authorization'] = 'Bearer $refreshToken';
      }
    } else {
      final String? token = await TokenStorage.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    final bool isUnauthorized = err.response?.statusCode == 401;

    if (!isUnauthorized) {
      return handler.next(err);
    }

    if (err.requestOptions.extra['isRetry'] == true) {
      await _handleSessionExpired();
      return handler.next(err);
    }

    if (err.requestOptions.extra['isRefreshRequest'] == true) {
      await _handleSessionExpired();
      return handler.next(err);
    }

    if (_refreshCompleter != null) {
      final String? newToken = await _refreshCompleter!.future;
      if (newToken != null) {
        return _retry(err.requestOptions, handler, newToken);
      }
      return handler.next(err);
    }

    _refreshCompleter = Completer<String?>();

    final Either<Failure, AuthResponseModel> result = await sl<AuthRepo>()
        .refreshToken();

    result.fold(
      (final Failure failure) async {
        _refreshCompleter!.complete(null);
        _refreshCompleter = null;
        await _handleSessionExpired();
        return handler.next(err);
      },
      (final AuthResponseModel authResponse) {
        final String newToken = authResponse.accessToken;
        _refreshCompleter!.complete(newToken);
        _refreshCompleter = null;
        return _retry(err.requestOptions, handler, newToken);
      },
    );
  }

  Future<void> _retry(
    final RequestOptions requestOptions,
    final ErrorInterceptorHandler handler,
    final String token,
  ) async {
    final Map<String, dynamic> headers = Map<String, dynamic>.from(
      requestOptions.headers,
    );
    headers['Authorization'] = 'Bearer $token';
    final Map<String, dynamic> extra = Map<String, dynamic>.from(
      requestOptions.extra,
    );
    extra['isRetry'] = true;

    final Options options = Options(
      method: requestOptions.method,
      headers: headers,
      extra: extra,
    );

    try {
      final Response<dynamic> response = await _dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }

  Future<void> _handleSessionExpired() async {
    await sl<AuthRepo>().logout();
  }
}
