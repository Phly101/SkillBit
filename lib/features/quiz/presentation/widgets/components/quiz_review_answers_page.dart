// quiz_review_content.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/page/quiz_and_contest_factory.dart';
import '../../../../../core/entities/quiz_question_entity.dart';
import '../../../../../core/entities/review_results_entity.dart';
import '../../../../../core/utils/features/quiz/review_data_mapper.dart';

class QuizReviewAnswers extends StatelessWidget {
  const QuizReviewAnswers({
    super.key,
    required this.reviewResult,
    required this.pageController,
  });

  final ReviewResultEntity reviewResult;
  final PageController pageController;

  @override
  Widget build(final BuildContext context) {
    final List<QuizQuestionEntity> reviewQuestions =
        ReviewDataMapper.toQuizQuestions(reviewResult.questions);
    final Map<int, int> selectedAnswers = ReviewDataMapper.toSelectedAnswers(
      reviewResult.questions,
    );

    return Stack(
      children: <Widget>[
        QuizAndContestFactory(
          allQuestions: reviewQuestions,
          selectedAnswers: selectedAnswers,
          pageController: pageController,
          isContest: false,
          contestDuration: Duration.zero,
          numOfParticipants: 0,
          isViewingAnswers: true,
          goHomeFunction: () => context.go(AppRoutes.home),
          submitFunction: () => Navigator.of(context).pop(),
          onOptionSelected: (final int qIndex, final int oIndex) {},
        ),
        // Positioned(
        //   top: 40,
        //   left: 10,
        //   child: ArrowBackButton(function: () => Navigator.of(context).pop()),
        // ),
      ],
    );
  }
}
