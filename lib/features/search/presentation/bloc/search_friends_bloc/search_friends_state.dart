part of 'search_friends_bloc.dart';

sealed class SearchFriendsState extends BaseState {
  const SearchFriendsState();
}

final class SearchFriendsInitial extends SearchFriendsState
    implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchFriendsLoading extends SearchFriendsState
    implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchFriendsClear extends SearchFriendsState
    implements ClearState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchFriendsSuccess extends SearchFriendsState
    implements SuccessState<List<SearchFriendsEntity>> {
  const SearchFriendsSuccess({required this.friends});

  final List<SearchFriendsEntity> friends;

  @override
  List<Object> get props => <Object>[friends];


}

final class SearchFriendsError extends SearchFriendsState
    implements ErrorState {
  const SearchFriendsError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
