part of 'search_friends_bloc.dart';

sealed class SearchFriendsState extends Equatable {
  const SearchFriendsState();
}

final class SearchFriendsInitial extends SearchFriendsState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchFriendsLoading extends SearchFriendsState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchFriendsClear extends SearchFriendsState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchFriendsSuccess extends SearchFriendsState {
  const SearchFriendsSuccess({this.friends});

  final List<SearchFriendsEntity>? friends;

  @override
  List<Object> get props => <Object>[];
}

final class SearchFriendsError extends SearchFriendsState {
  const SearchFriendsError({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}
