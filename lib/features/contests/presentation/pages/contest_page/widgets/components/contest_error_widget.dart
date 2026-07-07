import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/global/error/error_state_widget.dart';

class ContestErrorWidget extends StatelessWidget {
  const ContestErrorWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(final BuildContext context) {
    return ErrorStateWidget(message: message, reFreshFunction: () {});
  }
}
