import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBackButton(
          function: () {
            context.go(AppRoutes.home);
          },
          size: 30,
        ),
        title: Text(
          'My Notifications',
          style: context.textTheme.labelLarge!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend',
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(children: const <Widget>[]).pH(10),
    );
  }
}
