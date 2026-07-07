import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/contest&quiz/answer_color_factory.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.answerTitle,
    required this.isChosen,
    required this.optionIndex,
    this.isCorrect = false,
    this.isViewingAnswers = false,
    this.hint,
  });

  final String answerTitle;
  final bool isChosen;
  final int optionIndex;
  final bool isCorrect;
  final bool isViewingAnswers;
  final String? hint;

  String get _optionLetter => String.fromCharCode(65 + optionIndex);

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
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
              // Letter badge
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: statusColor.withValues(alpha: 0.1),
                  border: Border.all(color: statusColor, width: 1.5),
                ),
                child: Text(
                  _optionLetter,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Icon(statusIcon, color: statusColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(answerTitle, style: context.textTheme.bodyMedium),
              ),
            ],
          ),
        ),
        if (isViewingAnswers && isCorrect && hint != null && hint!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (final BuildContext context) => AlertDialog(
                    title: const Text('Explanation'),
                    content: Text(hint!),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Got it'),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.lightbulb_outline,
                    size: 16,
                    color: context.colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'View Hint',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    ).pV(15);
  }
}
