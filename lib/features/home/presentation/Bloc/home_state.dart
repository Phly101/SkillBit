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
  const HomeSuccess({
    required this.levelProgress,
    required this.courses,
    required this.currentLevelId,
  });

  final List<CourseEntity> courses;
  final double levelProgress;
  final String currentLevelId;

  @override
  List<Object> get props => <Object>[courses, levelProgress, currentLevelId];
}

final class HomeError extends HomeState implements ErrorState {
  const HomeError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
