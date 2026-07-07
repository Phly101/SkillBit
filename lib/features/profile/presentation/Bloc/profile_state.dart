part of 'profile_bloc.dart';

sealed class ProfileState extends BaseState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState implements InitialState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState implements LoadingState {
  @override
  List<Object> get props => [];
}

final class ProfileSuccess extends ProfileState implements SuccessState<UserProfileEntity> {
  const ProfileSuccess({required this.userProfile});

  final UserProfileEntity userProfile;

  @override
  List<Object> get props => [userProfile];
}

final class ProfileError extends ProfileState implements ErrorState {
  const ProfileError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => [message];
}
