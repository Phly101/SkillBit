import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textInputAction,
    this.isPassword = false,
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  bool obscure = true;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      autocorrect: true,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obscure == widget.isPassword,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: //Todo: Implement Function logic
                () {
                  setState(() {
                    isVisible = !isVisible;
                    obscure = !obscure;
                  });
                },
                icon: isVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : const SizedBox.shrink(),
        labelText: widget.label,
        labelStyle: context.textTheme.bodyMedium,
        errorStyle: context.textTheme.bodySmall!.copyWith(
          color: context.colorScheme.error,
          height: 0.8,
          fontSize: 11,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: context.colorScheme.tertiary,
            width: 2.0,
          ),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
