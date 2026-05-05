import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/features/auth/presentation/Bloc/auth_bloc.dart';

import '../../theme/theme.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    super.key,
    required this.label,
    required this.formKey,
    required this.onSubmit,
  });

  final String label;
  final GlobalKey<FormState> formKey;
  final AuthEvent Function() onSubmit;

  bool _isLoading(final BuildContext context) =>
      context.watch<AuthBloc>().state is AuthLoading;

  void _handlePress(final BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(onSubmit());
    }
  }

  @override
  Widget build(final BuildContext context) {
    final bool isLoading = _isLoading(context);
    return ElevatedButton(
      onPressed: isLoading ? null : () => _handlePress(context),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(label, style: context.textTheme.displayMedium),
    );
  }
}
