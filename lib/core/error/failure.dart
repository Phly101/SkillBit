import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message});
  final String? message;

  @override
  List<Object?> get props => <Object?>[];
}

// general Failures
class ServerFailures extends Failure {
  const ServerFailures({this.statusCode, this.message});
  final int? statusCode;
  @override
  final String? message;
}

class CacheFailures extends Failure {}

class NoInternetFailures extends Failure {}

class NetworkFailures extends Failure {}

class CancelledFailure extends Failure {}
class AlreadyEnrolledFailure extends Failure{}

class UserNotVerifiedFailure extends Failure {
  const UserNotVerifiedFailure({this.email});
  final String? email;

  @override
  List<Object?> get props => <Object?>[email];
}

class MessageFailure extends Failure {
  const MessageFailure(this.message);
  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
