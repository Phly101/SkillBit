import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class AnswerColorFactory {
  AnswerColorFactory._();

  static Color getStatusColor({
    required final BuildContext context,
    required final bool isViewingAnswers,
    required final bool isChosen,
    required final bool isCorrect,
  }) {
    if (!isViewingAnswers) {
      return isChosen ? context.colorScheme.tertiary : const Color(0xffCFDBE8);
    }

    // Viewing Results logic:
    if (isCorrect) {
      // green for correct
      return context.colorScheme.onError;
    }

    if (isChosen && !isCorrect) {
      // red for incorrect
      return context.colorScheme.error;
    }

    return const Color(0xffCFDBE8);
  }

  static IconData getIcon({
    required final bool isViewingAnswers,
    required final bool isChosen,
    required final bool isCorrect,
  }) {
    if (isViewingAnswers) {
      if (isCorrect) return Icons.check_circle; // Correct answer mark
      if (isChosen && !isCorrect) return Icons.cancel; // Wrong choice mark
    }
    return isChosen ? Icons.radio_button_checked : Icons.radio_button_off;
  }
}
