part of 'settings_bloc.dart';

sealed class SettingsState extends BaseState {
  const SettingsState();
}

final class SettingsInitial extends SettingsState implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class SettingsLoading extends SettingsState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class SettingSuccess extends SettingsState
    implements SuccessState<dynamic> {
  const SettingSuccess({required this.s});

  final SettingsEntity s;

  @override
  List<Object> get props => <Object>[s];
}

final class SettingsError extends SettingsState implements ErrorState {
  const SettingsError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

final class UploadImageLoading extends SettingsState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class UploadImageSuccess extends SettingsState
    implements SuccessState<dynamic> {
  const UploadImageSuccess({required this.profilePictureUrl});

  final String profilePictureUrl;

  @override
  List<Object> get props => <Object>[profilePictureUrl];
}

final class UploadImageError extends SettingsState implements ErrorState {
  const UploadImageError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
