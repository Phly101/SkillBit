part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsDetailsRequested extends SettingsEvent {
  const SettingsDetailsRequested();

  @override
  List<Object?> get props => <Object?>[];
}

class UploadImageEvent extends SettingsEvent {
  const UploadImageEvent({required this.imagePath});

  final String imagePath;

  @override
  List<Object?> get props => <Object?>[imagePath];
}
