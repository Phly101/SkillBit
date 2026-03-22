import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/contest&quiz/time_format.dart';

import '../../../../../utils/global/assets.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.contestDuration});

  final Duration contestDuration;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Duration remainingTime;
  Timer? timer;

  @override
  void initState() {
    remainingTime = widget.contestDuration;
    timer = Timer.periodic(const Duration(seconds: 1), (final Timer timer) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime -= const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    // 1. Calculate the percentage (remaining / total)
    final double percentRemaining =
        remainingTime.inSeconds / widget.contestDuration.inSeconds;

    // 2. Determine the color: Red if less than or equal to 10% remaining (90% passed)
    final Color timerColor = percentRemaining <= 0.1
        ? context.colorScheme.error
        : Colors.black;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(Assets.icon('clock_image.png')),
        10.widthBox,
        Text(
          TimeFormat.formatTime(remainingTime),
          style: context.textTheme.displayLarge!.copyWith(color: timerColor),
        ),
      ],
    );
  }
}
