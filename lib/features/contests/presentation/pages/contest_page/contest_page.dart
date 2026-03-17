import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/page/quiz_and_contest_factory.dart';
import '../../../../../core/entities/question_entity.dart';
import '../../../../../core/enums/question_difficulty.dart';
import '../../../../../core/router/routes.dart';
import '../../../domain/entities/contest_entity.dart';
import '../../../domain/entities/enums/contest_difficulty.dart';
import '../../../domain/entities/enums/contest_status.dart';
import '../../../domain/entities/enums/contest_type.dart';


class ContestPage extends StatefulWidget {
  const ContestPage({super.key});

  @override
  State<ContestPage> createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
  List<QuestionEntity> allQuestions = <QuestionEntity>[
    QuestionEntity(
      id: '1',
      title: 'What is the primary function of a Flutter "Widget"?',
      options: <String>[
        'Database management',
        'UI Declaration',
        'Hardware control',
        'API routing',
      ],
      questionDifficulty: QuestionDifficulty.easy,
      correctAnswerIndex: 1,
    ),
    QuestionEntity(
      id: '2',
      title: 'Which programming language is used to write Flutter apps?',
      options: <String>['Java', 'Python', 'Dart', 'Swift'],
      questionDifficulty: QuestionDifficulty.easy,
      correctAnswerIndex: 2,
    ),
    QuestionEntity(
      id: '3',
      title: 'In Clean Architecture, which layer should contain your Entities?',
      options: <String>['Data', 'Presentation', 'Domain', 'External'],
      questionDifficulty: QuestionDifficulty.medium,
      correctAnswerIndex: 2,
    ),
    QuestionEntity(
      id: '4',
      title: 'What does "L" in SOLID principles stand for?',
      options: <String>[
        'Liskov Substitution',
        'Logical Indexing',
        'Linear Scaling',
        'Layered Input',
      ],
      questionDifficulty: QuestionDifficulty.hard,
      correctAnswerIndex: 0,
    ),
    QuestionEntity(
      id: '5',
      title: 'Which state management library uses "Streams" extensively?',
      options: <String>['Provider', 'Bloc', 'SetState', 'GetX'],
      questionDifficulty: QuestionDifficulty.medium,
      correctAnswerIndex: 1,
    ),
    QuestionEntity(
      id: '6',
      title:
          'What is the complexity of searching an element in a balanced Binary Search Tree?',
      options: <String>['O(n)', 'O(n^2)', 'O(1)', 'O(log n)'],
      questionDifficulty: QuestionDifficulty.medium,
      correctAnswerIndex: 3,
    ),
    QuestionEntity(
      id: '7',
      title:
          'Which widget would you use to create a scrollable list of varying items?',
      options: <String>['Column', 'Row', 'ListView', 'Stack'],
      questionDifficulty: QuestionDifficulty.easy,
      correctAnswerIndex: 2,
    ),
    QuestionEntity(
      id: '8',
      title: 'What is the purpose of a "Git Merge Conflict"?',
      options: <String>[
        'To delete code',
        'To signal overlapping changes',
        'To speed up commits',
        'To encrypt data',
      ],
      questionDifficulty: QuestionDifficulty.easy,
      correctAnswerIndex: 1,
    ),
    QuestionEntity(
      id: '9',
      title: 'In HTTP, which method is typically used to update existing data?',
      options: <String>['GET', 'POST', 'PUT/PATCH', 'DELETE'],
      questionDifficulty: QuestionDifficulty.medium,
      correctAnswerIndex: 2,
    ),
    QuestionEntity(
      id: '10',
      title: 'What is the main advantage of using a "Final" variable in Dart?',
      options: <String>[
        'It can be changed later',
        'It must be set at compile-time',
        'It can only be set once',
        'It uses more memory',
      ],
      questionDifficulty: QuestionDifficulty.easy,
      correctAnswerIndex: 2,
    ),
    QuestionEntity(
      id: '11',
      title:
          'Which design pattern is used to provide a single point of access to a class?',
      options: <String>['Factory', 'Observer', 'Singleton', 'Strategy'],
      questionDifficulty: QuestionDifficulty.medium,
      correctAnswerIndex: 2,
    ),
    QuestionEntity(
      id: '12',
      title: 'What does "Dry" stand for in software development?',
      options: <String>[
        'Do Repeat Yourself',
        'Dont Repeat Yourself',
        'Data Ready Yield',
        'Direct Remote Yield',
      ],
      questionDifficulty: QuestionDifficulty.easy,
      correctAnswerIndex: 1,
    ),
  ];
  late ContestEntity contest = ContestEntity(
    title: 'Round 1',
    topic: 'Level 1',
    contestType: ContestType.global,
    contestDate: DateTime.now(),
    contestDuration: const Duration(hours: 1, minutes: 30),
    status: ContestStatus.active,
    contestDifficulty: ContestDifficulty.easy,
    numberOfQuestions: 20,
    totalContestScore: 500,
    questions: allQuestions,
  );

  @override
  Widget build(final BuildContext context) {
    return QuizAndContestFactory(
      allQuestions: allQuestions,
      contestDuration: contest.contestDuration,
      numOfParticipants: 30,
      //Todo: will be changed to dynamic when the User Entity is created
      goHomeFunction: //Todo: Implement Function logic
          () {},
      submitFunction: //Todo: Implement Function logic
      () {
        // temp navigation only
        context.go(AppRoutes.contestResults);
      },
      onOptionSelected: (final QuestionEntity question, final int optionIndex) {
        setState(() {
          question.selectedAnswerIndex = optionIndex;
        });
      },
      isContest: true,
      pageController: PageController(),
    );
  }
}
