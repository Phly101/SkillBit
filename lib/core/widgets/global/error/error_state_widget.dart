import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import '../../../theme/theme.dart';
import '../../../utils/global/assets.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
    required this.message,
    this.reFreshFunction,
    this.routeFunction,
  });

  final String message;
  final void Function()? reFreshFunction;
  final void Function()? routeFunction;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const .only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                message,
                maxLines: 3,
                overflow: .ellipsis,
                style: context.textTheme.displayLarge,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.heightOf(context) * 0.5,
                child: Lottie.asset(Assets.animation('Error_404.json')),
              ),
              ElevatedButton(
                onPressed: reFreshFunction,
                child: Text('Refresh', style: context.textTheme.displayMedium),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: ArrowBackButton(function: reFreshFunction),
        ),
      ],
    );
  }
}
