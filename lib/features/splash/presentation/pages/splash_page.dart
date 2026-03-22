import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../../../../core/app_state/app_state_notifier.dart';
import '../../../../core/utils/global/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<AppStateNotifier>().initializeApp();
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
