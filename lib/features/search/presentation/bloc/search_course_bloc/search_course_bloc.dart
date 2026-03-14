import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';
import 'package:skill_bit/features/search/domain/useCases/params/search_course_params.dart';
import 'package:skill_bit/features/search/domain/useCases/search_course_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_course_event.dart';

part 'search_course_state.dart';

const Duration _debounceDuration = Duration(milliseconds: 300);

EventTransformer<E> debounce<E>(final Duration duration) {
  return (final Stream<E> events, final EventMapper<E> mapper) =>
      events.debounce(duration).switchMap(mapper);
}

class SearchCourseBloc extends Bloc<SearchCourseEvent, SearchCourseState> {
  SearchCourseBloc({required this.searchCourseUseCase})
    : super(SearchCourseInitial()) {
    on<SearchCourseUpdated>(
      _onSearchUpdated,
      transformer: debounce(_debounceDuration),
    );
    on<SearchCourseCleared>(_onSearchCourseCleared);
  }

  final SearchCourseUseCase searchCourseUseCase;

  Future<void> _onSearchUpdated(
    final SearchCourseUpdated event,
    final Emitter<SearchCourseState> emit,
  ) async {
    // init state
    if (event.query.isEmpty) {
      emit(SearchCourseInitial());
      return;
    }
    // searching state

    emit(SearchCourseLoading());
    final Either<Failure, List<SearchCourseEntity>> result =
        searchCourseUseCase(SearchCourseParams(event.query));
    result.fold(
      //Failure case
      (final Failure failure) =>
          emit(const SearchCourseError(message: 'Failed to fetch Courses')),
      //Success case
      (final List<SearchCourseEntity> courses) =>
          emit(SearchCourseSuccess(courses: courses)),
    );
  }

  // clearing the search filed function
  Future<void> _onSearchCourseCleared(
    final SearchCourseCleared event,
    final Emitter<SearchCourseState> emit,
  ) async {
    final Either<Failure, List<SearchCourseEntity>> result =
        searchCourseUseCase(const SearchCourseParams(''));

    result.fold(
      //Failure case
      (final Failure failure) =>
          emit(const SearchCourseError(message: 'Could not reset list')),
      //Success case
      (final List<SearchCourseEntity> courses) =>
          emit(SearchCourseSuccess(courses: courses)),
    );
  }
}
