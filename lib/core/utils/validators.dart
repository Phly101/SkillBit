class AppValidators {
  AppValidators._();

  static String? validateName(final String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters long';
    }

    final RegExp nameRegExp = RegExp(r"^[a-zA-Z\s']+$");
    if (!nameRegExp.hasMatch(value)) {
      return 'Name can only contain letters';
    }
    return null;
  }

  static String? validateEmail(final String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address (e.g., name@example.com)';
    }
    return null;
  }

  static String? validatePassword(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Include at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Include at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Include at least one special character';
    }
    return null;
  }

  static String? validateConfirmPassword(
    final String? value,
    final String password,
  ) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}

class PasswordRequirements {
  PasswordRequirements({
    required this.hasUppercase,
    required this.hasDigits,
    required this.hasSpecial,
    required this.hasMinLength,
  });

  final bool hasUppercase;
  final bool hasDigits;
  final bool hasSpecial;
  final bool hasMinLength;

  bool get isAllMet => hasUppercase && hasDigits && hasSpecial && hasMinLength;

  static PasswordRequirements check(final String value) {
    return PasswordRequirements(
      hasUppercase: value.contains(RegExp(r'[A-Z]')),
      hasDigits: value.contains(RegExp(r'[0-9]')),
      hasSpecial: value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
      hasMinLength: value.length >= 8,
    );
  }
}
