import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

import '../widgets/widgets.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ScreenLayout(
        widget: Align(
          alignment: const Alignment(0, -0.9),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              children: <Widget>[
                // header
                const HeaderWidget(pageName: AuthStrings.verification),
                // Otp field
                const OtpWidget(),
                100.heightBox,

                // Send Button
                ElevatedButton(
                  onPressed: //Todo: Implement Function logic
                      () {},
                  child: const Text(AuthStrings.send),
                ),

                // Resend Button
                FooterWidget.verification(
                  onVerificationTap: //Todo: Implement Function logic
                      () {},
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
