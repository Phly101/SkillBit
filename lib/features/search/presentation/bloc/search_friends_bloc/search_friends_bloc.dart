import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/search/domain/entities/search_friends_entity.dart';
import 'package:skill_bit/features/search/domain/useCases/params/search_friends_params.dart';
import 'package:skill_bit/features/search/domain/useCases/search_friends_usecase.dart';
import '../../../../../core/utils/search_debouncer.dart';

part 'search_friends_event.dart';

part 'search_friends_state.dart';

class SearchFriendsBloc extends Bloc<SearchFriendsEvent, SearchFriendsState> {
  SearchFriendsBloc({required this.friendsUseCase})
    : super(SearchFriendsInitial()) {
    on<SearchFriendsUpdated>(_onSearchFriendsUpdated);
    on<SearchFriendsCleared>(_onSearchFriendsCleared);
  }

  final SearchFriendsUseCase friendsUseCase;
  final SearchDebouncer _debouncer = SearchDebouncer();

  // searching for a friend function
  Future<void> _onSearchFriendsUpdated(
    final SearchFriendsUpdated event,
    final Emitter<SearchFriendsState> emit,
  ) async {
    // init state
    if (event.query.isEmpty) {
      _debouncer.cancel();
      emit(SearchFriendsInitial());
      return;
    }
    // searching state
    SearchDebouncer().run(() async {
      emit(SearchFriendsLoading());
      final Either<Failure, List<SearchFriendsEntity>> result = friendsUseCase(
        SearchFriendsParams(event.query),
      );

      result.fold(
        //Failure case
        (final Failure failure) => emit(
          const SearchFriendsError(message: 'Could not find this friend'),
        ),
        //Success case
        (final List<SearchFriendsEntity> friends) =>
            emit(SearchFriendsSuccess(friends: friends)),
      );
    });
  }

  // clearing the search filed function
  Future<void> _onSearchFriendsCleared(
    final SearchFriendsCleared event,
    final Emitter<SearchFriendsState> emit,
  ) async {
    _debouncer.cancel();
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
