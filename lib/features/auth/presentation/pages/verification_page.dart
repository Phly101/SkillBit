import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/auth_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/auth/validators.dart';
import 'package:skill_bit/core/widgets/auth/auth_submit_button.dart';

import '../Bloc/auth_bloc.dart';
import '../widgets/widgets.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({
    super.key,
    required this.email,
    this.isResetPassword = false,
  });

  final String email;
  final bool isResetPassword;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
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
          if (state is AuthEmailVerified) {
            if (widget.isResetPassword) {
              context.go(
                AppRoutes.newPassword,
                extra: <String, String>{
                  'email': widget.email,
                  'code': _otpController.text.trim(),
                },
              );
            } else {
              context.go(AppRoutes.login);
            }
          }
          if (state is AuthCodeResent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Verification code resent'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: ScreenLayout(
          widget: Form(
            key: _formKey,
            child: Align(
              alignment: const Alignment(0, -0.9),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // header
                    const HeaderWidget(pageName: AuthStrings.verification),

                    // Otp field
                    OtpWidget(
                      controller: _otpController,
                      validator: (final String? value) =>
                          AppValidators.validateOTP(value),
                    ),
                    100.heightBox,

                    // Send Button
                    AuthSubmitButton(
                      label: AuthStrings.verification,
                      formKey: _formKey,
                      onSubmit: () => AuthVerifyEmailRequested(
                        email: widget.email,
                        code: _otpController.text,
                      ),
                    ),

                    // Resend Button
                    FooterWidget.verification(
                      onVerificationTap: () {
                        context.read<AuthBloc>().add(
                          AuthResendCodeRequested(email: widget.email),
                        );
                      },
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
