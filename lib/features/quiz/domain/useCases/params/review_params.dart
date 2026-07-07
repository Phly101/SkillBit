import 'package:equatable/equatable.dart';

class ReviewParams extends Equatable {
  const ReviewParams({required this.quizId});

  final String quizId;

  @override
  List<Object?> get props => <Object?>[quizId];
}
