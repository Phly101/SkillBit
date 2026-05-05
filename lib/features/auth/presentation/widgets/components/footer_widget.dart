import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/build_or_divider.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/custom_rich_text.dart';

import '../../../../../core/utils/global/assets.dart';

class FooterWidget extends StatelessWidget {
  factory FooterWidget.login({
    required final void Function() onSignUpTap,
    required final void Function() googleFunction,
  }) {
    return FooterWidget(
      googleFunction: googleFunction,
      goToFunction: onSignUpTap,
      footer: AuthStrings.loginFooter,
      name: AuthStrings.signUp,
    );
  }

  factory FooterWidget.signup({
    required final void Function() onLoginTap,
    required final void Function() googleFunction,
  }) {
    return FooterWidget(
      googleFunction: googleFunction,
      goToFunction: onLoginTap,
      footer: AuthStrings.signUpFooter,
      name: AuthStrings.login,
    );
  }

  factory FooterWidget.verification({
    required final void Function() onVerificationTap,
  }) {
    return FooterWidget(
      goToFunction: onVerificationTap,
      footer: AuthStrings.verificationFooter,
      name: AuthStrings.reSend,
      showSocials: false,
      showOr: false,
    );
  }

  const FooterWidget({
    super.key,
    required this.goToFunction,
    required this.footer,
    required this.name,
    this.googleFunction,
    this.showSocials = true,
    this.showOr = true,
  });

  final String footer;
  final String name;
  final void Function() goToFunction;
  final void Function()? googleFunction;
  final bool showSocials;
  final bool showOr;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        40.heightBox,
        if (showOr) ...<Widget>[const BuildOrDivider()],
        if (showSocials) ...<Widget>[
          Row(
            mainAxisAlignment: .center,
            children: <Widget>[
              GestureDetector(
                onTap: googleFunction,
                child: Image.asset(Assets.icon('Google_Original.png')).pH(10),
              ),
            ],
          ).pV(45),
        ],
        20.heightBox,
        CustomRichText(function: goToFunction, footer: footer, name: name),
        20.heightBox,
      ],
    );
  }
}
