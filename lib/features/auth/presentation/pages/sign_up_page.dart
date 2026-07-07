import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/app_state/app_state_notifier.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/auth/validators.dart';
import 'package:skill_bit/core/widgets/auth/auth_submit_button.dart';
import 'package:skill_bit/features/auth/presentation/Bloc/auth_bloc.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/custom_text_field.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/password_validation_rules_widget.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/screen_layout.dart';
import 'package:skill_bit/features/auth/presentation/widgets/components/footer_widget.dart';
import 'package:skill_bit/features/auth/presentation/widgets/components/header_widget.dart';


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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (final BuildContext context, final AuthState state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: context.colorScheme.error,
              ),
            );
          }
          if (state is AuthAuthenticated) {
            context.read<AppStateNotifier>().setLoggedIn();
          }
          if (state is AuthNeedsVerification) {
            context.go(
              AppRoutes.verification,
              extra: <String, dynamic>{'email': state.email, 'isReset': false},
            );
          }
        },
        child: ScreenLayout(
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
                  AuthSubmitButton(
                    label: AuthStrings.signUp,
                    formKey: _formKey,
                    onSubmit: () => AuthSignUpRequested(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                      confirmPassword: _confirmPasswordController.text.trim(),
                      name: _nameController.text.trim(),
                    ),
                  ),
                  FooterWidget.signup(
                    googleFunction: () {
                      context.read<AuthBloc>().add(
                        const AuthGoogleSignInRequested(),
                      );
                    },
                    onLoginTap: () {
                      context.go(AppRoutes.login);
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
