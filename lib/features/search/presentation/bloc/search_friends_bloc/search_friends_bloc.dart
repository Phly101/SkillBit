import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/search/domain/entities/search_friends_entity.dart';
import 'package:skill_bit/features/search/domain/useCases/params/search_friends_params.dart';
import 'package:skill_bit/features/search/domain/useCases/search_friends_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_friends_event.dart';

part 'search_friends_state.dart';

const Duration _debounceDuration = Duration(milliseconds: 300);

EventTransformer<E> debounce<E>(final Duration duration) {
  return (final Stream<E> events, final EventMapper<E> mapper) =>
      events.debounce(duration).switchMap(mapper);
}

class SearchFriendsBloc extends Bloc<SearchFriendsEvent, SearchFriendsState> {
  SearchFriendsBloc({required this.friendsUseCase})
    : super(SearchFriendsInitial()) {
    on<SearchFriendsUpdated>(
      _onSearchFriendsUpdated,
      transformer: debounce(_debounceDuration),
    );
    on<SearchFriendsCleared>(_onSearchFriendsCleared);
  }

  final SearchFriendsUseCase friendsUseCase;

  // searching for a friend function
  Future<void> _onSearchFriendsUpdated(
    final SearchFriendsUpdated event,
    final Emitter<SearchFriendsState> emit,
  ) async {
    // init state
    if (event.query.isEmpty) {
      emit(SearchFriendsInitial());
      return;
    }
    // searching state

    emit(SearchFriendsLoading());
    final Either<Failure, List<SearchFriendsEntity>> result = friendsUseCase(
      SearchFriendsParams(event.query),
    );

    result.fold(
      //Failure case
      (final Failure failure) =>
          emit(const SearchFriendsError(message: 'Could not find this friend')),
      //Success case
      (final List<SearchFriendsEntity> friends) =>
          emit(SearchFriendsSuccess(friends: friends)),
    );
  }

  // clearing the search filed function
  Future<void> _onSearchFriendsCleared(
    final SearchFriendsCleared event,
    final Emitter<SearchFriendsState> emit,
  ) async {
    final Either<Failure, List<SearchFriendsEntity>> result = friendsUseCase(
      const SearchFriendsParams(''),
    );
    result.fold(
      (final Failure failure) =>
          emit(const SearchFriendsError(message: 'Could not reset list')),
      (final List<SearchFriendsEntity> courses) =>
          emit(SearchFriendsSuccess(friends: courses)),
    );
  }
}
