import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/profile_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/gradiant_container.dart';

class ProgressPieCharWidget extends StatefulWidget {
  const ProgressPieCharWidget({super.key});

  @override
  State<ProgressPieCharWidget> createState() => _ProgressPieCharWidgetState();
}

class _ProgressPieCharWidgetState extends State<ProgressPieCharWidget> {
  bool showProgress = false;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: //Todo: Implement Function logic
          () {
            setState(() {
              showProgress = !showProgress;
            });
          },
          child: Align(
            alignment: .centerLeft,
            child: GradiantContainer(
              radius: 16,
              child: Text(
                ProfileStrings.showYourProgress,
                style: context.textTheme.displayMedium,
              ).p10(),
            ),
          ),
        ),
        if (showProgress) ...<Widget>[
          Container(width: 100, height: 100, color: Colors.blue),
          Container(width: 100, height: 100, color: Colors.red),
          Container(width: 100, height: 100, color: Colors.purple),
        ],
      ],
    );
  }
}
