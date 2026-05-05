import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/theme/app_colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required this.controller,
    this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(final BuildContext context) {
    final PinTheme defaultPinTheme = PinTheme(
      width: 60,
      height: 65,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColors.secBlue.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Pinput(
      length: 6,
      controller: controller,
      validator: validator,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.tertiary),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: Colors.red),
        ),
      ),
    );
  }
}
