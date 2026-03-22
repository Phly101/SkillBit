import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';

import '../../../../core/constants/auth_strings.dart';
import '../../../../core/theme/theme.dart';

import '../../../../core/utils/features/auth/validators.dart';
import '../widgets/common/password_validation_rules_widget.dart';
import '../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = .new();
  final TextEditingController _confirmPasswordController = .new();
  final TextEditingController _emailController = .new();
  final TextEditingController _nameController = .new();

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
    _confirmPasswordController.dispose();
    _nameController.dispose();
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const HeaderWidget(
                  pageTitle: AuthStrings.signUpTitle,
                  pageName: AuthStrings.signUp,
                ),
                10.heightBox,
                //Name
                CustomTextField(
                  label: AuthStrings.nameField,
                  controller: _nameController,
                  validator: (final String? value) =>
                      AppValidators.validateName(value),
                ),
                40.heightBox,

                //Email
                CustomTextField(
                  label: AuthStrings.emailField,
                  controller: _emailController,
                  validator: (final String? value) =>
                      AppValidators.validateEmail(value),
                ),
                30.heightBox,

                //Password
                CustomTextField(
                  label: AuthStrings.newPasswordField,
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

                30.heightBox,
                //Confirm Password
                CustomTextField(
                  label: AuthStrings.confirmPasswordField,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  controller: _confirmPasswordController,
                  validator: (final String? value) =>
                      AppValidators.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                ),
                40.heightBox,

                // Sign up Button
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AuthStrings.signUp,
                    style: context.textTheme.displayMedium,
                  ),
                ),
                FooterWidget.signup(
                  onLoginTap: () {
                    context.go(AppRoutes.login);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
