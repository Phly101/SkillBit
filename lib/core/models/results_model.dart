// results_model.dart
import 'package:skill_bit/core/entities/results_details_entity.dart';



class ResultsModel extends ResultsDetails {
  ResultsModel({
    required super.wrongAnswers,
    required super.correctAnswers,
    required super.totalQuestions,
    required super.quizScore,
    super.timeTaken,
  });

  factory ResultsModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] as Map<String, dynamic>;
    final num correct = (data['correctAnswers'] ?? data['correctCount']) as num;
    final num wrong = (data['wrongAnswers'] ?? data['wrongCount'] ??
        data['lost']) as num;
    final num score = (data['quizScore'] ?? data['score']) as num;

    return ResultsModel(
      wrongAnswers: wrong,
      correctAnswers: correct,
      totalQuestions: data['totalQuestions'] as num,
      quizScore: score,
      timeTaken: data['timeTaken'] as int?,
    );
  }
}