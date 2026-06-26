import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerText extends StatefulWidget {
  const CountdownTimerText({
    super.key,
    required this.targetDate,
    required this.style,
    this.onFinished,
  });

  final DateTime targetDate;
  final TextStyle? style;
  final VoidCallback? onFinished;

  @override
  State<CountdownTimerText> createState() => _CountdownTimerTextState();
}

class _CountdownTimerTextState extends State<CountdownTimerText> {
  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.targetDate.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (final _) {
      final Duration next = widget.targetDate.difference(DateTime.now());
      if (next.isNegative) {
        setState(() => _remaining = Duration.zero);
        _timer?.cancel();
        widget.onFinished?.call();
      } else {
        setState(() => _remaining = next);
      }
    });
  }

  String _format(final Duration d) {
    final int days = d.inDays;
    final int hours = d.inHours % 24;
    final int minutes = d.inMinutes % 60;
    final int seconds = d.inSeconds % 60;

    final String hh = hours.toString().padLeft(2, '0');
    final String mm = minutes.toString().padLeft(2, '0');
    final String ss = seconds.toString().padLeft(2, '0');

    return days > 0 ? '${days}d $hh:$mm:$ss' : '$hh:$mm:$ss';

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Text(_format(_remaining), style: widget.style);
  }
}