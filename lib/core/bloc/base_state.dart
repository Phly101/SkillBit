import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => <Object?>[];
}

abstract class SuccessState<T> extends BaseState {
  const SuccessState();



  @override
  List<Object?> get props => <Object?>[];
}

abstract class InitialState extends BaseState {
  const InitialState();

  @override
  List<Object?> get props => <Object?>[];
}

abstract class ErrorState extends BaseState {
  const ErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}

abstract class LoadingState extends BaseState {
  const LoadingState();

  @override
  List<Object?> get props => <Object?>[];
}

abstract class ClearState extends BaseState {
  const ClearState();

  @override
  List<Object?> get props => <Object?>[];
}
