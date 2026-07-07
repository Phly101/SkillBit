import '../entities/send_answers_entity.dart';

class SendContestAnswerModel extends SendAnswers {
  SendContestAnswerModel({
    required super.quizId,
    required super.answers,
    required super.timeTaken,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    'contestId': quizId,
    'answers': answers,
    'timeTakn': timeTaken.inSeconds,
  };
}
