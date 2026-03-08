import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/contact_us_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_body.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
          'Badges',
          style: context.textTheme.displayLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: const BadgeBody(),
    );
  }
}
