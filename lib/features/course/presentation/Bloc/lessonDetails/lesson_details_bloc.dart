import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/core/utils/global/launch_external_url.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/lesson_entity.dart';
import '../../../domain/useCases/activeLearingActions/visit_article.dart';
import '../../../domain/useCases/activeLearingActions/watch_video.dart';
import '../../../domain/useCases/coursePageFetching/get_lesson_details.dart';
import '../../../domain/useCases/params/lesson_params.dart';
import '../../../domain/useCases/params/resource_params.dart';

part 'lesson_details_event.dart';

part 'lesson_details_state.dart';

class LessonDetailsBloc extends Bloc<LessonDetailsEvent, LessonDetailsState> {
  LessonDetailsBloc({
    required this.getLessonDetailsUseCase,
    required this.visitArticleUseCase,
    required this.watchVideoUseCase,
  }) : super(LessonDetailsInitial()) {
    on<LoadLessonDetails>(_onLoadLessonDetails);
    on<WatchVideoEvent>(_onWatchVideo);
    on<VisitArticleEvent>(_onVisitArticle);
  }

  final GetLessonDetailsUseCase getLessonDetailsUseCase;
  final VisitArticleUseCase visitArticleUseCase;
  final WatchVideoUseCase watchVideoUseCase;

  //  Loading a specific Lesson
  Future<void> _onLoadLessonDetails(
    final LoadLessonDetails event,
    final Emitter<LessonDetailsState> emit,
  ) async {
    emit(LessonDetailsLoading());
    final Either<Failure, LessonEntity> result = await getLessonDetailsUseCase(
      LessonParams(courseId: event.courseId, lessonId: event.lessonId),
    );

    result.fold(
      (final Failure failure) => emit(
        const LessonDetailsError(message: 'could not get lesson details'),
      ),
      (final LessonEntity lesson) => emit(LessonDetailSuccess(lesson: lesson)),
    );
  }

  // Video
  Future<void> _onWatchVideo(
    final WatchVideoEvent event,
    final Emitter<LessonDetailsState> emit,
  ) async {
    try {
      final uri = Uri.parse(event.url);
      if (await canLaunchUrl(uri)) {
        await LaunchExternalUrl.launchExternalUrl(uri);
      } else {
        emit(const LessonActionFailure(message: 'Could not open this link.'));
      }
    } catch (e) {
      emit(const LessonActionFailure(message: 'Invalid link format.'));
    }
  }

  //  Article
  Future<void> _onVisitArticle(
    final VisitArticleEvent event,
    final Emitter<LessonDetailsState> emit,
  ) async {
    try {
      final uri = Uri.parse(event.url);
      if (await canLaunchUrl(uri)) {
        await LaunchExternalUrl.launchExternalUrl(uri);
        await visitArticleUseCase(
          ResourceParams(
            id: event.articleId,
            lessonId: event.lessonId,
            courseId: event.courseId,
          ),
        );
      } else {
        emit(const LessonActionFailure(message: 'Could not open this link.'));
      }
    } catch (e) {
      emit(const LessonActionFailure(message: 'Invalid link format.'));
    }
  }
}
