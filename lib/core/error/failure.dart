import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  const Failure();
  @override
  List<Object?> get props => <Object?>[];
}
// general Failures
class ServerFailures extends Failure{}
class CacheFailures extends Failure{}