import 'package:equatable/equatable.dart';

class ReviewContestParams extends Equatable {
  const ReviewContestParams({required this.contestId});

  final String contestId;

  @override
  List<Object?> get props => <Object?>[contestId];
}
