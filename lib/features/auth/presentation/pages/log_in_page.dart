import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../../../../core/utils/features/auth/validators.dart';
import '../widgets/common/password_validation_rules_widget.dart';
import '../widgets/widgets.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = .new();
  final TextEditingController _emailController = .new();

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
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    //Todo: don't forget to activate the validation
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ScreenLayout(
        widget: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteractionIfError,
          child: Align(
            alignment: const Alignment(0, -0.9),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // header
                  const HeaderWidget(
                    pageTitle: AuthStrings.loginTitle,
                    pageName: AuthStrings.login,
                  ),
                  15.heightBox,

                  // Email
                  CustomTextField(
                    label: AuthStrings.emailField,
                    controller: _emailController,
                    validator: (final String? value) =>
                        AppValidators.validateEmail(value),
                  ),
                  30.heightBox,

                  // Password
                  CustomTextField(
                    label: AuthStrings.passwordField,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    controller: _passwordController,
                    validator: (final String? value) =>
                        AppValidators.validatePassword(value),
                  ),
                  10.heightBox,
                  PasswordValidationRulesWidget(
                    password: _passwordController.text,
                  ),
                  10.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        context.go(AppRoutes.forgotPassword);
                      },
                      child: Text(
                        '${AuthStrings.forgotPassword}?',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  30.heightBox,
                  // Login button
                  ElevatedButton(
                    onPressed: //Todo: Implement Function logic
                        () {},
                    child: Text(
                      AuthStrings.login,
                      style: context.textTheme.displayMedium,
                    ),
                  ),
                  FooterWidget.login(
                    onSignUpTap: () {
                      context.go(AppRoutes.signUp);
                    },
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
