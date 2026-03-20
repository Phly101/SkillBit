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
    this.function,
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
          SizedBox(
            width: double.infinity,
            height: MediaQuery.heightOf(context) * 0.5,
            child: Lottie.asset(assetUrl),
          ),
          Text(screenTitle, style: context.textTheme.displayLarge),
          Text(
            description,
            style: context.textTheme.bodyMedium,
            textAlign: .center,
          ).p10(),
          const Spacer(),
          ElevatedButton(
            onPressed: function,
            child: Text(buttonText, style: context.textTheme.displayMedium),
          ),
        ],
      ).p10(),
    );
  }
}
