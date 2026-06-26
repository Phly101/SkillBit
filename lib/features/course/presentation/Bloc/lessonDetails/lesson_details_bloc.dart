import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/lesson_entity.dart';
import '../../../domain/useCases/coursePageFetching/get_lesson_details.dart';
import '../../../domain/useCases/params/lesson_params.dart';

part 'lesson_details_event.dart';

part 'lesson_details_state.dart';

class LessonDetailsBloc extends Bloc<LessonDetailsEvent, LessonDetailsState> {
  LessonDetailsBloc({required this.getLessonDetailsUseCase})
    : super(LessonDetailsInitial()) {
    on<LoadLessonDetails>(_onLoadLessonDetails);
  }

  final GetLessonDetailsUseCase getLessonDetailsUseCase;

  //  Loading a specific Lesson
  Future<void> _onLoadLessonDetails(
    final LoadLessonDetails event,
    final Emitter<LessonDetailsState> emit,
  ) async {
    emit(LessonDetailsLoading());
    final Either<Failure, LessonDetailsEntity> result =
        await getLessonDetailsUseCase(LessonParams(lessonId: event.lessonId));

    result.fold(
      (final Failure failure) => emit(
        const LessonDetailsError(message: 'could not get lesson details'),
      ),
      (final LessonDetailsEntity lesson) =>
          emit(LessonDetailSuccess(lesson: lesson)),
    );
  }
}
