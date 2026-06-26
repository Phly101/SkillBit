import 'dart:io';

import '../models/settings_model.dart';

abstract class SettingsRemoteDataSource {
  Future<String> uploadImage(final File imageFile);

  Future<SettingsModel> getSettings();
}
