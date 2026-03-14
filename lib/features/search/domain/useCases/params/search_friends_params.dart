import 'package:equatable/equatable.dart';

class SearchFriendsParams extends Equatable {
  const SearchFriendsParams(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}
