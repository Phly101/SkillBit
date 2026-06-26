import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({super.key, required this.text, this.trimLines = 5});

  final String text;
  final int trimLines;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Text(
            widget.text,
            maxLines: _isExpanded ? null : widget.trimLines,
            overflow: _isExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ),
        TextButton(
          onPressed: () => setState(() => _isExpanded = !_isExpanded),
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            _isExpanded ? 'Show Less' : 'Read More',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
