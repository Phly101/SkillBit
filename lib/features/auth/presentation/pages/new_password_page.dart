import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/auth/validators.dart';
import 'package:skill_bit/core/widgets/auth/auth_submit_button.dart';
import 'package:skill_bit/features/auth/presentation/Bloc/auth_bloc.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/custom_text_field.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/password_validation_rules_widget.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/screen_layout.dart';
import 'package:skill_bit/features/auth/presentation/widgets/components/header_widget.dart';


class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key, required this.email, required this.code});

  final String email;
  final String code;

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
          if (state is AuthPasswordResetSuccess) {
            context.go(AppRoutes.login);
          }
        },
        child: ScreenLayout(
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
                    AuthSubmitButton(
                      label: AuthStrings.send,
                      formKey: _formKey,
                      onSubmit: () => AuthResetPasswordRequested(
                        email: widget.email,
                        code: widget.code,
                        newPassword: _passwordController.text.trim(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
