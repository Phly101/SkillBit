import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.onChanged,
    this.textInputAction,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextInputAction? textInputAction;


  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      autocorrect: true,
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: context.textTheme.bodyMedium,
        errorStyle: context.textTheme.bodySmall!.copyWith(
          color: context.colorScheme.error,
          height: 0.8,
          fontSize: 11,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
