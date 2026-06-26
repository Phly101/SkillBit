part of 'home_bloc.dart';

sealed class HomeState extends BaseState {
  const HomeState();
}

final class HomeInitial extends HomeState implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class HomeLoading extends HomeState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class HomeSuccess extends HomeState implements SuccessState<dynamic> {
  const HomeSuccess({required this.homeDetailsEntity, required this.levelId});

  final HomeDetailsEntity homeDetailsEntity;
  final int levelId;

  @override
  List<Object> get props => <Object>[homeDetailsEntity, levelId];
}

final class HomeError extends HomeState implements ErrorState {
  const HomeError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
