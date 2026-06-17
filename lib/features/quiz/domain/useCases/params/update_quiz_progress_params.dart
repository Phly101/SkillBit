import 'package:equatable/equatable.dart';

class UpdateQuizProgressParams extends Equatable {
  const UpdateQuizProgressParams({required this.quizId, required this.score});

  final String quizId;
  final int score;

  @override
  List<Object?> get props => <Object?>[quizId, score];
}
