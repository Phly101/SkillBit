import 'package:dio/dio.dart';
import 'package:skill_bit/core/error/exceptions/exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioException.connectionTimeout:
      case DioException.receiveTimeout:
      case DioException.sendTimeout:
        throw const NetworkTimeoutException();
      case DioException.connectionError:
        throw const NoInternetException();
      case DioException.badResponse:
        _handleStatusCode(err.response?.statusCode, err.response?.data);
      default:
        throw const UnknownException();
    }
  }

  void _handleStatusCode(final int? statusCode, final dynamic data) {
    final String? message = data?['message'] as String?;
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
