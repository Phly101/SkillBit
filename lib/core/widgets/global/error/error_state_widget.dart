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
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 50),
          Row(
            children: <Widget>[
              if(routeFunction != null)
                Row(
                  children: <Widget>[
                    ArrowBackButton(function: routeFunction),
                  ],
                )
              else
                const SizedBox(),
              const SizedBox(width: 8),
              Expanded(
                child: Center(
                  child: Text(
                    '$message!',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.displayLarge!.copyWith(
                      color: context.colorScheme.error,
                    ),
                  ),
                ),
              ),
            ],
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
    );
  }
}
