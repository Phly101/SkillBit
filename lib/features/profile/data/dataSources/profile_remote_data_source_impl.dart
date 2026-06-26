import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../models/user_profile_model.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<UserProfileModel> getProfileData() async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getProfile(),
    );
    return UserProfileModel.fromJson(response as Map<String, dynamic>);
  }
}
