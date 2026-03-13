import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/answer_color_factory.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.answerTitle,
    required this.isChosen,
    this.isCorrect = false,
    this.isViewingAnswers = false,
  });

  final String answerTitle;
  final bool isChosen;
  final bool isCorrect;
  final bool isViewingAnswers;

  @override
  Widget build(final BuildContext context) {
    final Color statusColor = AnswerColorFactory.getStatusColor(
      context: context,
      isViewingAnswers: isViewingAnswers,
      isChosen: isChosen,
      isCorrect: isCorrect,
    );

    final IconData statusIcon = AnswerColorFactory.getIcon(
      isViewingAnswers: isViewingAnswers,
      isChosen: isChosen,
      isCorrect: isCorrect,
    );

    return Container(
      // Custom padding
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: statusColor, width: 2),
        color: isChosen
            ? statusColor.withValues(alpha: 0.05)
            : Colors.transparent,
      ),
      child: Row(
        children: <Widget>[
          Icon(statusIcon, color: statusColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(answerTitle, style: context.textTheme.bodyMedium),
          ),
        ],
      ),
    ).pV(15);
  }
}
