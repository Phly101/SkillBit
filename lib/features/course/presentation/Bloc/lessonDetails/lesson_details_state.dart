part of 'lesson_details_bloc.dart';

sealed class LessonDetailsState extends BaseState {
  const LessonDetailsState();
}

final class LessonDetailsInitial extends LessonDetailsState
    implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class LessonDetailsLoading extends LessonDetailsState
    implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class LessonDetailSuccess extends LessonDetailsState
    implements SuccessState<dynamic> {
  const LessonDetailSuccess({required this.lesson});

  final LessonEntity lesson;

  @override
  List<Object> get props => <Object>[lesson];
}


final class LessonDetailsError extends LessonDetailsState
    implements ErrorState {
  const LessonDetailsError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
