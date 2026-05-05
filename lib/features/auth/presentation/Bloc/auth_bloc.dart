import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/useCases/forgot_password.dart';
import 'package:skill_bit/features/auth/domain/useCases/log_out.dart';
import 'package:skill_bit/features/auth/domain/useCases/login.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/email_params.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/login_params.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/reset_password_params.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/sign_up_params.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/verification_params.dart';
import 'package:skill_bit/features/auth/domain/useCases/resend_verification_code.dart';
import 'package:skill_bit/features/auth/domain/useCases/reset_password.dart';
import 'package:skill_bit/features/auth/domain/useCases/sign_in_with_google.dart';
import 'package:skill_bit/features/auth/domain/useCases/sign_up.dart';
import 'package:skill_bit/features/auth/domain/useCases/verify_email.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required final Login login,
    required final SignUp signUp,
    required final Logout logout,
    required final ForgotPassword forgotPassword,
    required final ResetPassword resetPassword,
    required final VerifyEmail verifyEmail,
    required final ResendVerificationCode resendCode,
    required final SignInWithGoogle googleSignIn,
  }) : _login = login,
       _signUp = signUp,
       _logout = logout,
       _forgotPassword = forgotPassword,
       _resetPassword = resetPassword,
       _verifyEmail = verifyEmail,
       _resendCode = resendCode,
       _googleSignIn = googleSignIn,
       super(AuthInitial()) {
    on<AuthLoginRequested>(_onLogin);
    on<AuthSignUpRequested>(_onSignUp);
    on<AuthVerifyEmailRequested>(_onVerifyEmail);
    on<AuthGoogleSignInRequested>(_onGoogleSignIn);
    on<AuthLogoutRequested>(_onLogout);
    on<AuthForgotPasswordRequested>(_onForgotPassword);
    on<AuthResetPasswordRequested>(_onResetPassword);
    on<AuthResendCodeRequested>(_onResendCode);
  }

  final Login _login;
  final SignUp _signUp;
  final Logout _logout;
  final ForgotPassword _forgotPassword;
  final ResetPassword _resetPassword;
  final VerifyEmail _verifyEmail;
  final ResendVerificationCode _resendCode;
  final SignInWithGoogle _googleSignIn;

  Future<void> _onLogin(
    final AuthLoginRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, void> result = await _login(
      LoginParams(email: event.email, password: event.password),
    );
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'Could not log in')),
      (_) => emit(AuthEmailVerified()),
    );
  }

  Future<void> _onSignUp(
    final AuthSignUpRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, UserEntity> result = await _signUp(
      SignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'Could not sign up')),
      (final UserEntity user) =>
          emit(AuthNeedsVerification(email: event.email)),
    );
  }

  Future<void> _onLogout(
    final AuthLogoutRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, void> result = await _logout(const NoParams());
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'could not log out')),
      (_) => emit(AuthEmailVerified()),
    );
  }

  Future<void> _onForgotPassword(
    final AuthForgotPasswordRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, void> result = await _forgotPassword(
      EmailParams(email: event.email),
    );
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'Could not send reset email')),
      (_) => emit(AuthPasswordResetEmailSent()),
    );
  }

  Future<void> _onGoogleSignIn(
    final AuthGoogleSignInRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, UserEntity> result = await _googleSignIn(
      const NoParams(),
    );
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'could not sign in with Google')),
      (final UserEntity user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onVerifyEmail(
    final AuthVerifyEmailRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, void> result = await _verifyEmail(
      VerificationParams(email: event.email, code: event.code),
    );
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'Verification failed')),
      (_) => emit(AuthEmailVerified()),
    );
  }

  Future<void> _onResetPassword(
    final AuthResetPasswordRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, void> result = await _resetPassword(
      ResetPasswordParams(
        email: event.email,
        code: event.code,
        newPassword: event.newPassword,
      ),
    );
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'Could not reset password')),
      (_) => emit(AuthPasswordResetSuccess()),
    );
  }

  Future<void> _onResendCode(
    final AuthResendCodeRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either<Failure, void> result = await _resendCode(
      EmailParams(email: event.email),
    );
    result.fold(
      (final Failure failure) =>
          emit(const AuthError(message: 'Could not resend code')),
      (_) => emit(AuthCodeResent()),
    );
  }
}
