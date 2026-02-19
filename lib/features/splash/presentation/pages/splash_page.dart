import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      context.go(AppRoutes.onBoarding);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: <Widget>[
            Image.asset(Assets.imageLogo('splash_logo.png')),
            Text('Skillbit', style: context.textTheme.displayLarge),
            Text(
              'Ignite your coding journey',
              style: context.textTheme.bodyMedium,
            ).p10(),
          ],
        ),
      ),
    );
  }
}
