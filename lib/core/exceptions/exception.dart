import 'package:equatable/equatable.dart';

abstract class Exception extends Equatable {
  const Exception();

  @override
  List<Object?> get props => <Object?>[];
}

// general Exception
class ServerException extends Exception {}

class CacheException extends Exception {}
