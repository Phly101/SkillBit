import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skill_bit/core/constants/api_endpoints.dart';
import 'package:skill_bit/core/network/api_client.dart';
import 'package:skill_bit/features/settings/data/dataSources/settings_remote_data_source.dart';
import 'package:skill_bit/features/settings/data/models/settings_model.dart';

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  const SettingsRemoteDataSourceImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<SettingsModel> getSettings() async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getSettings,
    );
    return SettingsModel.fromJson(response);
  }

  @override
  Future<String> uploadImage(final File imageFile) async {
    final FormData formData = FormData.fromMap(<String, dynamic>{
      'image': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
      ),
    });

    final dynamic response = await apiClient.patch(
      endpoint: ApiEndpoints.uploadImage(),
      data: formData,
    );

    return response['data']['profilePicture'] as String;
  }
}
