import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) {
    debugPrint('┌── REQUEST ──────────────────────────');
    debugPrint('│ ${options.method} ${options.uri}');
    debugPrint('│ Headers: ${options.headers}');
    debugPrint('│ Body: ${options.data}');
    debugPrint('└─────────────────────────────────────');
    handler.next(options);
  }

  @override
  void onResponse(
    final Response<dynamic> response,
    final ResponseInterceptorHandler handler,
  ) {
    debugPrint('┌── RESPONSE ─────────────────────────');
    debugPrint('│ Status: ${response.statusCode}');
    debugPrint('│ Data: ${response.data}');
    debugPrint('└─────────────────────────────────────');
    handler.next(response);
  }

  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    debugPrint('┌── ERROR ────────────────────────────');
    debugPrint('│ ${err.response?.statusCode} ${err.message}');
    debugPrint('└─────────────────────────────────────');
    handler.next(err);
  }
}
