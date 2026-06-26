import '../entities/send_answers_entity.dart';

class SendQuizAnswersModel extends SendAnswers {
  SendQuizAnswersModel({
    required super.quizId,
    required super.answers,
    required super.timeTaken,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    'quizId': quizId,
    'answers': answers,
    'timeTakn': timeTaken.inSeconds,
  };
}
