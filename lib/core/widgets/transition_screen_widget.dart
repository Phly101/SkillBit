import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skill_bit/core/theme/theme.dart';

class TransitionScreenWidget extends StatelessWidget {
  const TransitionScreenWidget({
    super.key,
    required this.assetUrl,
    required this.screenTitle,
    required this.description,
    required this.buttonText,
    required this.function,
  });

  final String assetUrl;
  final String screenTitle;
  final String description;
  final String buttonText;
  final void Function()? function;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: <Widget>[
          150.heightBox,
          Lottie.asset(assetUrl),
          20.heightBox,
          Text(screenTitle, style: context.textTheme.displayLarge).p10(),
          Text(description, style: context.textTheme.bodyMedium).p10(),
          const Spacer(),
          ElevatedButton(
            onPressed: function,
            child: Text(buttonText, style: context.textTheme.displayMedium),
          ).pV(40),

        ],
      ).p10(),
    );
  }
}
