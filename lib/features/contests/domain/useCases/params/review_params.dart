import 'package:equatable/equatable.dart';

class ReviewParams extends Equatable {
  const ReviewParams({required this.contestId});

  final String contestId;

  @override
  List<Object?> get props => <Object?>[contestId];
}
