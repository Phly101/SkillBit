import 'package:flutter/material.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/password_validation_rules_widget.dart';

import '../../../../core/constants/auth_strings.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/widgets.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = .new();
  final TextEditingController _confirmPasswordController = .new();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ScreenLayout(
        widget: Align(
          alignment: const Alignment(0, -0.9),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteractionIfError,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: .min,
                children: <Widget>[
                  // Header
                  const HeaderWidget(pageName: AuthStrings.newPassword),

                  // Password
                  CustomTextField(
                    label: AuthStrings.newPasswordField,
                    isPassword: true,
                    textInputAction: TextInputAction.next,
                    controller: _passwordController,
                    validator: (final String? value) =>
                        AppValidators.validatePassword(value),
                  ),
                  10.heightBox,
                  PasswordValidationRulesWidget(
                    password: _passwordController.text,
                  ),
                  40.heightBox,
                  // Confirm Password
                  CustomTextField(
                    label: AuthStrings.confirmField,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    controller: _confirmPasswordController,
                    validator: (final String? value) =>
                        AppValidators.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                  ),
                  70.heightBox,
                  // Send Button
                  ElevatedButton(
                    onPressed: //Todo: Implement Function logic
                        () {},
                    child: Text(
                      AuthStrings.send,
                      style: context.textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
