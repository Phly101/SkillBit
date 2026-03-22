part of 'search_friends_bloc.dart';

sealed class SearchFriendsEvent extends Equatable {
  const SearchFriendsEvent();
}

class SearchFriendsUpdated extends SearchFriendsEvent {
  const SearchFriendsUpdated(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}

class SearchFriendsCleared extends SearchFriendsEvent {
  @override
  List<Object?> get props => <Object?>[];
}
