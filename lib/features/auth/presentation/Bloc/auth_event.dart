part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => <Object?>[email, password];
}

class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested({
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword
  });

  final String email;
  final String password;
  final String confirmPassword;
  final String name;

  @override
  List<Object?> get props => <Object?>[email, password, name,confirmPassword];
}

class AuthGoogleSignInRequested extends AuthEvent {
  const AuthGoogleSignInRequested();
}

class AuthVerifyEmailRequested extends AuthEvent {
  const AuthVerifyEmailRequested({required this.email, required this.code});

  final String email;
  final String code;

  @override
  List<Object?> get props => <Object?>[email, code];
}

class AuthResendCodeRequested extends AuthEvent {
  const AuthResendCodeRequested({required this.email});

  final String email;

  @override
  List<Object?> get props => <Object?>[email];
}

class AuthForgotPasswordRequested extends AuthEvent {
  const AuthForgotPasswordRequested({required this.email});

  final String email;

  @override
  List<Object?> get props => <Object?>[email];
}

class AuthResetPasswordRequested extends AuthEvent {
  const AuthResetPasswordRequested({
    required this.email,
    required this.code,
    required this.newPassword,
  });

  final String email;
  final String code;
  final String newPassword;

  @override
  List<Object?> get props => <Object?>[email, code, newPassword];
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}
