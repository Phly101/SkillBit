import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/auth/data/models/auth_response_model.dart';
import 'package:skill_bit/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login({
    required final String email,
    required final String password,
  });

  Future<Either<Failure, UserEntity>> signUp({
    required final String email,
    required final String password,
    required final String name,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword({required final String email});

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, void>> verifyEmail({
    required final String code,
    required final String email,
  });

  Future<Either<Failure, void>> reSendVerificationCode({
    required final String email,
  });

  Future<Either<Failure, void>> resetPassword({
    required final String email,
    required final String code,
    required final String newPassword,
  });

  Future<Either<Failure, AuthResponseModel>> refreshToken();
  Future<Either<Failure,bool>> isAuthenticated();
}
