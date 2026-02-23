import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/build_or_divider.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/custom_rich_text.dart';

import '../../../../../core/utils/assets.dart';

class FooterWidget extends StatelessWidget {
  factory FooterWidget.login({required final void Function() onSignUpTap}) {
    return FooterWidget(
      function: onSignUpTap,
      footer: AuthStrings.loginFooter,
      name: AuthStrings.signUp,
    );
  }

  factory FooterWidget.signup({required final void Function() onLoginTap}) {
    return FooterWidget(
      function: onLoginTap,
      footer: AuthStrings.signUpFooter,
      name: AuthStrings.login,
    );
  }

  factory FooterWidget.verification({
    required final void Function() onVerificationTap,
  }) {
    return FooterWidget(
      function: onVerificationTap,
      footer: AuthStrings.verificationFooter,
      name: AuthStrings.reSend,
      showSocials: false,
      showOr: false,
    );
  }

  const FooterWidget({
    super.key,
    required this.function,
    required this.footer,
    required this.name,
    this.showSocials = true,
    this.showOr =true,
  });

  final String footer;
  final String name;
  final void Function() function;
  final bool showSocials;
  final bool showOr;

  @override
  Widget build(final BuildContext context) {
    return Column(

      children: <Widget>[
        40.heightBox,
        if(showOr)...<Widget>[const BuildOrDivider(),],
        if (showSocials) ...<Widget>[
          Row(
            mainAxisAlignment: .center,
            children: <Widget>[
              Image.asset(Assets.icon('Facebook_Original.png')).pH(10),
              Image.asset(Assets.icon('Google_Original.png')).pH(10),
              Image.asset(Assets.icon('Apple_Original.png')).pH(10),
            ],

          ).pV(45),
          ],
          CustomRichText(function: function, footer: footer, name: name),
          20.heightBox,

      ],
    );
  }
}
