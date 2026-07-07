import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import '../../../../core/widgets/global/error/error_state_widget.dart';
import '../Bloc/quiz_bloc.dart';
import '../widgets/components/quiz_review_answers_page.dart';

class QuizReviewPage extends StatefulWidget {
  const QuizReviewPage({super.key, required this.quizId});

  final String quizId;

  @override
  State<QuizReviewPage> createState() => _QuizReviewPageState();
}

class _QuizReviewPageState extends State<QuizReviewPage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(QuizReviewRequested(quizId: widget.quizId));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BoxStateSwitcher<QuizBloc, QuizState>(
      onSuccess: (final BuildContext context, final QuizState state) {
        if (state is QuizReviewSuccess) {
          return QuizReviewAnswers(
            reviewResult: state.reviewResult,
            pageController: _pageController,
          );
        }
        return const SizedBox.shrink();
      },
      onError:
          (
            final String message,
            final BuildContext context,
            final QuizState state,
          ) => ErrorStateWidget(
            message: message,
            reFreshFunction: () => context.read<QuizBloc>().add(
              QuizReviewRequested(quizId: widget.quizId),
            ),
            routeFunction: () => Navigator.of(context).pop(),
          ),
      onInitial: (final BuildContext context, final QuizState state) =>
          const SizedBox.shrink(),
    );
  }
}
