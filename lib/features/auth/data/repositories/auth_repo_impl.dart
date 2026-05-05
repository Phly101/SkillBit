import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:skill_bit/core/app_state/app_state_notifier.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/network/network_info.dart';
import 'package:skill_bit/core/utils/storage/token_storage.dart';
import 'package:skill_bit/features/auth/data/dataSources/Remote_data_source/auth_remote_data_source.dart';
import 'package:skill_bit/features/auth/data/models/auth_response_model.dart';
import 'package:skill_bit/features/auth/domain/entities/user_entity.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/exceptions/exception.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, void>> forgotPassword({
    required final String email,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left<Failure, void>(NoInternetFailures());
    }
    try {
      await authRemoteDataSource.forgotPassword(email);
      return const Right<Failure, void>(null);
    } on ServerException {
      return Left<Failure, void>(ServerFailures());
    } catch (e) {
      return Left<Failure, void>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required final String email,
    required final String password,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left<Failure, void>(NoInternetFailures());
    }
    try {
      final dynamic response = await authRemoteDataSource.login(
        email,
        password,
      );

      await TokenStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      await TokenStorage.saveId(userId: response.id ?? 'user_id');

      sl<AppStateNotifier>().setLoggedIn();

      return const Right<Failure, void>(null);
    } on ServerException {
      return Left<Failure, void>(ServerFailures());
    } on NetworkException {
      return Left<Failure, void>(NetworkFailures());
    } catch (e) {
      debugPrint('Login Error: $e');
      return Left<Failure, void>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> reSendVerificationCode({
    required final String email,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left<Failure, void>(NoInternetFailures());
    }
    try {
      await authRemoteDataSource.reSendVerificationCode(email);
      return const Right<Failure, void>(null);
    } on ServerException {
      return Left<Failure, void>(ServerFailures());
    } catch (e) {
      return Left<Failure, void>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> refreshToken() async {
    try {
      if (!await networkInfo.isConnected) {
        return Left<Failure, AuthResponseModel>(NoInternetFailures());
      }
      final AuthResponseModel newToken = await authRemoteDataSource
          .refreshToken();

      await TokenStorage.saveTokens(
        accessToken: newToken.accessToken,
        refreshToken: newToken.refreshToken,
      );

      return Right<Failure, AuthResponseModel>(newToken);
    } on ServerException {
      return Left<Failure, AuthResponseModel>(ServerFailures());
    } catch (e) {
      debugPrint('Token Refresh Error: $e');
      return Left<Failure, AuthResponseModel>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required final String email,
    required final String code,
    required final String newPassword,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left<Failure, void>(NoInternetFailures());
    }
    try {
      await authRemoteDataSource.resetPassword(email, code, newPassword);
      return const Right<Failure, void>(null);
    } on ServerException {
      return Left<Failure, void>(ServerFailures());
    } on NetworkException {
      return Left<Failure, void>(NetworkFailures());
    } catch (e) {
      debugPrint('change password error: $e');
      return Left<Failure, void>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    if (!await networkInfo.isConnected) {
      return Left<Failure, UserEntity>(NoInternetFailures());
    }
    try {
      final AuthResponseModel response = await authRemoteDataSource
          .signInWithGoogle();
      await TokenStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      await TokenStorage.saveId(userId: response.id ?? 'user_id');
      sl<AppStateNotifier>().setLoggedIn();
      return Right<Failure, UserEntity>(
        UserEntity(id: response.id ?? 'returning_user'),
      );
    } on OperationCancelledException {
      return Left<Failure, UserEntity>(CancelledFailure());
    } catch (e) {
      debugPrint('Google Sign In Error: $e');
      return Left<Failure, UserEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required final String email,
    required final String password,
    required final String name,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left<Failure, UserEntity>(NoInternetFailures());
    }
    try {
      final UserEntity user = await authRemoteDataSource.signUp(
        email,
        password,
        name,
      );
      return Right<Failure, UserEntity>(user);
    } on ServerException {
      return Left<Failure, UserEntity>(ServerFailures());
    } on NetworkException {
      return Left<Failure, UserEntity>(NetworkFailures());
    } catch (e) {
      debugPrint('Signup Error: $e');
      return Left<Failure, UserEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail({
    required final String code,
    required final String email,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left<Failure, void>(NoInternetFailures());
    }
    try {
      await authRemoteDataSource.verifyEmail(code, email);
      return const Right<Failure, void>(null);
    } on ServerException {
      return Left<Failure, void>(ServerFailures());
    } on NetworkException {
      return Left<Failure, void>(NetworkFailures());
    } catch (e) {
      debugPrint(e.toString());
      return Left<Failure, void>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await TokenStorage.clearTokens();
      sl<AppStateNotifier>().logout();
      return const Right<Failure, void>(null);
    } catch (e) {
      debugPrint(e.toString());
      return Left<Failure, void>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    final String? token = await TokenStorage.getAccessToken();
    try {
      return Right<Failure, bool>(token != null);
    } on CacheException {
      return Left<Failure, bool>(CacheFailures());
    }
  }
}
