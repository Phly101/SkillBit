import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/utils/search_debouncer.dart';
import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';
import 'package:skill_bit/features/search/domain/useCases/params/search_course_params.dart';
import 'package:skill_bit/features/search/domain/useCases/search_course_usecase.dart';

part 'search_course_event.dart';

part 'search_course_state.dart';

class SearchCourseBloc extends Bloc<SearchCourseEvent, SearchCourseState> {
  SearchCourseBloc({required this.searchCourseUseCase})
    : super(SearchCourseInitial()) {
    on<SearchCourseUpdated>(_onSearchUpdated);
    on<SearchCourseCleared>(_onSearchCourseCleared);
  }

  final SearchCourseUseCase searchCourseUseCase;
  final SearchDebouncer _debouncer = SearchDebouncer();

  Future<void> _onSearchUpdated(
    final SearchCourseUpdated event,
    final Emitter<SearchCourseState> emit,
  ) async {
    // init state
    if (event.query.isEmpty) {
      _debouncer.cancel();
      emit(SearchCourseInitial());
      return;
    }
    // searching state
    SearchDebouncer().run(() async {
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
    });
  }

  // clearing the search filed function
  Future<void> _onSearchCourseCleared(
    final SearchCourseCleared event,
    final Emitter<SearchCourseState> emit,
  ) async {
    _debouncer.cancel();
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
