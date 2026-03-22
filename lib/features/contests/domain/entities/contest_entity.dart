import 'package:skill_bit/core/entities/question_entity.dart';
import 'enums/contest_difficulty.dart';
import 'enums/contest_status.dart';
import 'enums/contest_type.dart';


class ContestEntity {
  ContestEntity({
    required this.title,
    required this.topic,
    required this.contestType,
    required this.contestDate,
    required this.contestDuration,
    required this.status,
    required this.numberOfQuestions,
    required this.totalContestScore,
    required this.questions,
    required this.contestDifficulty,
  });

  final String title;
  final String topic;
  final ContestType contestType;
  final DateTime contestDate;
  final Duration contestDuration;
  final ContestDifficulty contestDifficulty;
  final List<QuestionEntity> questions;
  final int numberOfQuestions;
  final double totalContestScore;
  final ContestStatus status;

  //Todo: challenger id and challenged id
  //Todo: list of participants parameter
}
