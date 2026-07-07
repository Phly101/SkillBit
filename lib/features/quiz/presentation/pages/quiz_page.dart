import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/entities/quiz_question_entity.dart';
import 'package:skill_bit/core/entities/send_answers_entity.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/page/quiz_and_contest_factory.dart';
import 'package:skill_bit/features/quiz/presentation/Bloc/quiz_bloc.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.courseId,
    required this.quizId,
    required this.lessonId,
  });

  final String? courseId;
  final String? quizId;
  final String? lessonId;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController _pageController = PageController();
  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(
      QuizStartRequested(quizId: widget.quizId ?? ''),
    );
  }

  void _submitQuiz(
    final BuildContext context,
    final List<QuizQuestionEntity> questions,
    final Map<int, int> selections,
  ) {
    final List<String> formattedAnswers = <String>[];
    for (int i = 0; i < questions.length; i++) {
      final int? selection = selections[i];
      if (selection == null) {
        formattedAnswers.add('');
      } else {
        formattedAnswers.add(String.fromCharCode(65 + selection));
      }
    }

    context.read<QuizBloc>().add(
      QuizSubmitRequested(
        answers: SendAnswers(
          quizId: widget.quizId ?? '',
          answers: formattedAnswers,
          timeTaken: _elapsedTime,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocListener<QuizBloc, QuizState>(
      listener: (final BuildContext context, final QuizState state) {
        if (state is QuizSubmitSuccess) {
          context.goNamed(
            'quiz_results',
            pathParameters: <String, String>{
              'courseId': widget.courseId ?? '',
              'lessonId': widget.lessonId ?? '',
              'quizId': widget.quizId ?? '',
            },
            extra: state.results,
          );
        } else if (state is QuizSubmitError) {
          ErrorStateWidget(
            message: state.message,
            reFreshFunction: () {
              final QuizState currentState = context.read<QuizBloc>().state;
              if (currentState is QuizStartSuccess) {
                _submitQuiz(
                  context,
                  currentState.quiz.questions,
                  currentState.selectedAnswers,
                );
              }
            },
            routeFunction: null,
          );
        }
      },
      child: BoxStateSwitcher<QuizBloc, QuizState>(
        onError:
            (
              final String message,
              final BuildContext context,
              final QuizState state,
            ) => ErrorStateWidget(
              message: message,
              reFreshFunction: () => context.read<QuizBloc>().add(
                QuizStartRequested(quizId: widget.quizId ?? ''),
              ),

              routeFunction: () => context.goNamed(
                'course_details',
                pathParameters: <String, String>{
                  'courseId': widget.courseId ?? '',
                },
              ),
            ),
        onInitial: (final BuildContext context, final QuizState state) =>
            const SizedBox.shrink(),
        //Todo: make a skeleton loading screen
        loadingWidget: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        onSuccess: (final BuildContext context, final QuizState state) {
          if (state is QuizStartSuccess) {
            return QuizAndContestFactory(
              allQuestions: state.quiz.questions,
              selectedAnswers: state.selectedAnswers,
              pageController: _pageController,
              isContest: false,
              contestDuration: Duration(minutes: state.quiz.timeLimit),
              numOfParticipants: 0,
              goHomeFunction: () => context.go(AppRoutes.home),
              onTick: (final Duration elapsed) {
                _elapsedTime = elapsed;
              },
              submitFunction: () => _submitQuiz(
                context,
                state.quiz.questions,
                state.selectedAnswers,
              ),
              onOptionSelected: (final int qIndex, final int oIndex) {
                context.read<QuizBloc>().add(
                  QuizAnswerSelected(
                    questionIndex: qIndex,
                    optionIndex: oIndex,
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
