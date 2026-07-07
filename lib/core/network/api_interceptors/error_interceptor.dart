import 'package:dio/dio.dart';
import 'package:skill_bit/core/error/exceptions/exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    DioException errorToReject;

    switch (err.type) {
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        errorToReject = DioException(
          requestOptions: err.requestOptions,
          error: const NetworkTimeoutException(),
        );
        break;
      case DioExceptionType.connectionError:
        errorToReject = DioException(
          requestOptions: err.requestOptions,
          error: const NoInternetException(),
        );
        break;
      case DioExceptionType.badResponse:
        try {
          _handleStatusCode(err.response!.statusCode, err.response!.data);
          errorToReject = err;
        } catch (e) {
          errorToReject = DioException(
            requestOptions: err.requestOptions,
            error: e,
          );
        }
        break;
      default:
        errorToReject = DioException(
          requestOptions: err.requestOptions,
          error: const UnknownException(),
        );
    }

    return handler.reject(
      errorToReject,
    );
  }

  void _handleStatusCode(final int? statusCode, final dynamic data) {
    print('SERVER DATA: $data');
    final String? message = data?['message'] as String?;
    final bool? isVerified = data?['is_verified'] ?? data?['isVerified'];

    if (isVerified == false) {
      final String? email = data?['email'] as String?;
      throw UserNotVerifiedException(email: email);
    }

    switch (statusCode) {
      // user exceptions
      case 400:
        throw BadRequestException(message);
      case 401:
        throw const UnauthorizedException();
      case 403:
        throw const ForbiddenException();
      case 404:
        throw NotFoundException(message);
      // server exceptions
      case 500:
      case 502:
      case 503:
        throw const ServerException();
      default:
        throw const UnknownException();
    }
  }
}
