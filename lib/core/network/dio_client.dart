import 'package:dio/dio.dart';
import 'package:skill_bit/core/network/api_client.dart';
import 'package:skill_bit/core/network/api_interceptors/auth_interceptor.dart';
import 'package:skill_bit/core/network/api_interceptors/error_interceptor.dart';
import 'package:skill_bit/core/network/api_interceptors/logging_interceptor.dart';

import '../constants/api_endpoints.dart';

class DioClient implements ApiClient {
  DioClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    _dio.interceptors.addAll(<Interceptor>[
      AuthInterceptor(_dio),
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  final Dio _dio;

  @override
  Future<dynamic> delete({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  }) async {
    final Response<dynamic> response = await _dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(extra: extra),
    );
    return response.data;
  }

  @override
  Future<dynamic> get({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  }) async {
    final Response<dynamic> response = await _dio.get(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(extra: extra),
    );
    return response.data;
  }

  @override
  Future<dynamic> patch({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  }) async {
    final Response<dynamic> response = await _dio.patch(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(extra: extra),
    );
    return response.data;
  }

  @override
  Future<dynamic> post({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  }) async {
    final Response<dynamic> response = await _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(extra: extra),
    );
    return response.data;
  }
}
