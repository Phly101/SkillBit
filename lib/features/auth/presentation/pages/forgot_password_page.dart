import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

import '../../../../core/utils/validators.dart';
import '../widgets/widgets.dart';
import '../../../../core/utils/assets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = .new();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ScreenLayout(
        widget: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteractionIfError,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .min,
              children: <Widget>[
                // Header
                const HeaderWidget(pageName: AuthStrings.forgotPassword),
                70.heightBox,

                // animation
                Lottie.asset(
                  Assets.animation('Forgot_Password.json'),
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                80.heightBox,
                // Email
                CustomTextField(
                  label: AuthStrings.emailField,
                  controller: _emailController,
                  validator: (final String? value) =>
                      AppValidators.validateEmail(value),
                ),
                // send Button
                ElevatedButton(
                  onPressed: //Todo: Implement Function logic
                      () {},
                  child: const Text(AuthStrings.send),
                ).pV(40),
                80.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
