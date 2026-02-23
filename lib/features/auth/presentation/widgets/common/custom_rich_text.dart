import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/theme.dart';

class CustomRichText extends StatefulWidget {
  const CustomRichText({
    super.key,
    required this.function,
    required this.footer,
    required this.name,
  });

  final String footer;
  final String name;
  final void Function() function;

  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}

class _CustomRichTextState extends State<CustomRichText> {
  late TapGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()..onTap = widget.function;
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Text.rich(
      TextSpan(
        text: widget.footer,
        style: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.textSecondary,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: widget.name,
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.primary,
            ),
            recognizer: _recognizer,
          ),
        ],
      ),
    );
  }
}
