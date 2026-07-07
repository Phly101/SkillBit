import 'package:flutter/foundation.dart';
import 'package:skill_bit/core/constants/api_endpoints.dart';
import 'package:skill_bit/core/error/exceptions/exception.dart';
import 'package:skill_bit/core/network/api_client.dart';
import 'package:skill_bit/features/auth/data/dataSources/Remote_data_source/auth_remote_data_source.dart';
import 'package:skill_bit/features/auth/domain/entities/user_entity.dart';
import '../../models/models.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required this.apiClient,
    required this.googleSignIn,
  });

  final ApiClient apiClient;
  final GoogleSignIn googleSignIn;

  @override
  Future<void> forgotPassword(final String email) async {
    await apiClient.post(
      endpoint: ApiEndpoints.forgotPassword,
      data: EmailModel(email: email).toJson(),
    );
  }

  @override
  Future<AuthResponseModel> login(
    final String email,
    final String password,
  ) async {
    final dynamic response = await apiClient.post(
      endpoint: ApiEndpoints.login,
      data: LoginModel(email: email, password: password).toJson(),
    );
    return AuthResponseModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<void> reSendVerificationCode(final String email) async {
    await apiClient.post(
      endpoint: ApiEndpoints.reSendOTP,
      data: EmailModel(email: email).toJson(),
    );
  }

  @override
  Future<AuthResponseModel> refreshToken() async {
    final dynamic response = await apiClient.post(
      endpoint: ApiEndpoints.refresh,
      extra: <String, dynamic>{'isRefreshRequest': true},
    );
    final Map<String, dynamic> body = response as Map<String, dynamic>;
    return AuthResponseModel.fromJson(body['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> resetPassword(
    final String email,
    final String code,
    final String newPassword,
  ) async {
    await apiClient.post(
      endpoint: ApiEndpoints.resetPassword,
      data: ResetPassModel(
        email: email,
        code: code,
        newPassword: newPassword,
      ).toJson(),
    );
  }

  @override
  Future<UserEntity> signUp(
    final String email,
    final String password,
    final String name,
    final String confirmPassword,
    final String? role,
  ) async {
    final dynamic response = await apiClient.post(
      endpoint: ApiEndpoints.signUp,
      data: SignupModel(
        email: email,
        password: password,
        name: name,
        confirmPassword: confirmPassword,
        role: role ?? 'user',
      ).toJson(),
    );

    return UserModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<AuthResponseModel> signInWithGoogle() async {
    // Ensure we start with a clean state
    await googleSignIn.signOut();

    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final String? idToken = googleUser.authentication.idToken;

    if (idToken == null || idToken.isEmpty) {
      debugPrint('Failed to get ID Token from Google');
      throw const ServerException();
    }

    final dynamic response = await apiClient.post(
      endpoint: ApiEndpoints.signInWithGoogle,
      data: <String, dynamic>{'idToken': idToken},
    );

    return AuthResponseModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<void> verifyEmail(final String code, final String email) async {
    await apiClient.post(
      endpoint: ApiEndpoints.verifyEmail,
      data: VerifyModel(email: email, code: code).toJson(),
    );
  }
}
