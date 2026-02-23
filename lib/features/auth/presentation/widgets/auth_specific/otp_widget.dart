import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/theme/app_colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

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
    return
      Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.tertiary),
        ),
      ),

    );
  }
}
