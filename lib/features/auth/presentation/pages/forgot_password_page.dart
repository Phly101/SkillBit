import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/auth/validators.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import 'package:skill_bit/core/widgets/auth/auth_submit_button.dart';
import 'package:skill_bit/features/auth/presentation/Bloc/auth_bloc.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/custom_text_field.dart';
import 'package:skill_bit/features/auth/presentation/widgets/common/screen_layout.dart';
import 'package:skill_bit/features/auth/presentation/widgets/components/header_widget.dart';


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
          if (state is AuthPasswordResetEmailSent) {
            context.go(
              AppRoutes.verification, 
              extra: <String, Object>{
                'email': _emailController.text.trim(),
                'isReset': true,
              },
            );
          }
        },
        child: ScreenLayout(
          widget: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteractionIfError,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  AuthSubmitButton(
                    label: AuthStrings.send,
                    formKey: _formKey,
                    onSubmit: () => AuthForgotPasswordRequested(
                      email: _emailController.text.trim(),
                    ),
                  ).pV(40),
                  80.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
