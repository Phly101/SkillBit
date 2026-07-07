import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import '../../../../core/utils/global/assets.dart';
import '../../../../core/widgets/onboarding/transition_screen_widget.dart';
import '../Bloc/quiz_bloc.dart';

class QuizDetailsPage extends StatelessWidget {
  const QuizDetailsPage({
    super.key,
    required this.title,
    required this.difficulty,
    required this.time,
    required this.passingScore,
    required this.courseId,
    required this.quizId,
    required this.lessonId,
  });

  final String title;
  final String difficulty;
  final int time;
  final int passingScore;
  final String courseId;
  final String quizId;
  final String lessonId;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: TransitionScreenWidget(
              assetUrl: Assets.animation('checklist.json'),
              screenTitle: title,
              description:
                  'Attempting quiz, This quiz\'s difficulty is: $difficulty  time needed to completed the quiz is: $time min  score needed to pass is: $passingScore %',
              buttonText: 'Start Quiz now!',
              function: () {
                context.read<QuizBloc>().add(
                  QuizStartRequested(quizId: quizId),
                );
                context.goNamed(
                  'quiz_page',
                  pathParameters: <String, String>{
                    'courseId': courseId,
                    'lessonId': lessonId,
                    'quizId': quizId,
                  },
                );
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: ArrowBackButton(
              function: () {
                context.goNamed(
                  'course_details',
                  pathParameters: <String, String>{'courseId': courseId},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
