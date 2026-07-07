import 'package:skill_bit/features/auth/data/models/auth_response_model.dart';
import 'package:skill_bit/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(final String email, final String password);

  Future<UserEntity> signUp(
    final String email,
    final String password,
    final String confirmPassword,
    final String name,
    final String? role,
  );

  Future<void> forgotPassword(final String email);

  Future<AuthResponseModel> signInWithGoogle();

  Future<void> verifyEmail(final String code, final String email);

  Future<void> reSendVerificationCode(final String email);

  Future<void> resetPassword(
    final String email,
    final String code,
    final String newPassword,
  );

  Future<AuthResponseModel> refreshToken();
}
