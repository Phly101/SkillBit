part of 'auth_bloc.dart';

sealed class AuthState extends BaseState {
  const AuthState();
}

final class AuthInitial extends AuthState implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class AuthLoading extends AuthState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class AuthAuthenticated extends AuthState
    implements SuccessState<UserEntity> {
  const AuthAuthenticated({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => <Object>[user];
}

final class AuthNeedsVerification extends AuthState
    implements SuccessState<String> {
  const AuthNeedsVerification({required this.email});

  final String email;

  @override
  List<Object> get props => <Object>[email];
}

final class AuthPasswordResetEmailSent extends AuthState
    implements SuccessState<void> {
  @override
  List<Object> get props => <Object>[];
}

final class AuthCodeResent extends AuthState implements SuccessState<void> {
  @override
  List<Object> get props => <Object>[];
}

final class AuthEmailVerified extends AuthState implements SuccessState<void> {
  @override
  List<Object> get props => <Object>[];
}

final class AuthPasswordResetSuccess extends AuthState
    implements SuccessState<void> {
  @override
  List<Object> get props => <Object>[];
}

final class AuthError extends AuthState implements ErrorState {
  const AuthError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
