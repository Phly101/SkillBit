import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => <Object?>[];
}

// general Failures
class ServerFailures extends Failure {}

class CacheFailures extends Failure {}

class NoInternetFailures extends Failure {}

class NetworkFailures extends Failure {}

class CancelledFailure extends Failure {}

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
