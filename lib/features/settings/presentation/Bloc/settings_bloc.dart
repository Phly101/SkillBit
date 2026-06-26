import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/error/failure.dart';

import '../../../../core/bloc/base_state.dart';
import '../../../../core/useCases/use_cases.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/useCases/get_settings.dart';
import '../../domain/useCases/params/upload_params.dart';
import '../../domain/useCases/upload_image.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.getSettings, required this.uploadImage})
    : super(SettingsInitial()) {
    on<SettingsDetailsRequested>(_onSettingsDetailsRequested);
    on<UploadImageEvent>(_onUploadImageEvent);
  }

  final GetSettings getSettings;
  final UploadImage uploadImage;

  Future<void> _onSettingsDetailsRequested(
    final SettingsDetailsRequested event,
    final Emitter<SettingsState> emit,
  ) async {
    emit(SettingsLoading());

    final Either<Failure, SettingsEntity> result = await getSettings(
      const NoParams(),
    );

    result.fold(
      (final Failure failure) => emit(
        SettingsError(message: failure.message ?? 'could not get settings'),
      ),
      (final SettingsEntity settings) => emit(SettingSuccess(s: settings)),
    );
  }

  Future<void> _onUploadImageEvent(
    final UploadImageEvent event,
    final Emitter<SettingsState> emit,
  ) async {
    emit(UploadImageLoading());

    final Either<Failure, String> result = await uploadImage(
      UploadParams(imageUrl: event.imagePath),
    );

    result.fold(
      (final Failure failure) => emit(
        UploadImageError(message: failure.message ?? 'could not upload'),
      ),
      (final String url) => emit(UploadImageSuccess(profilePictureUrl: url)),
    );
  }
}
