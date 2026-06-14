import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  const AppException();

  @override
  List<Object?> get props => <Object?>[];

  @override
  bool get stringify => true;
}

class NoNetworkException extends AppException {
  const NoNetworkException();
}

class OperationCancelledException extends AppException {
  const OperationCancelledException();
}

class NetworkException extends AppException {
  const NetworkException();
}

class ServerException extends AppException {
  const ServerException();
}

class UnauthorizedException extends AppException {
  const UnauthorizedException();
}

class ForbiddenException extends AppException {
  const ForbiddenException();
}

class UserNotVerifiedException extends AppException {
  const UserNotVerifiedException({this.email});
  final String? email;

  @override
  List<Object?> get props => <Object?>[email];
}

class NotFoundException extends AppException {
  const NotFoundException([this.message]);

  final String? message;

  @override
  List<Object?> get props => <Object?>[message];
}

class NetworkTimeoutException extends AppException {
  const NetworkTimeoutException();
}

class BadRequestException extends AppException {
  const BadRequestException([this.message]);

  final String? message;

  @override
  List<Object?> get props => <Object?>[message];
}

class UnknownException extends AppException {
  const UnknownException();
}

class CacheException extends AppException {
  const CacheException();
}

class NoInternetException extends AppException {
  const NoInternetException();
}
