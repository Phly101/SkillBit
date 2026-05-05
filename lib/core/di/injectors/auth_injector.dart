import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/auth/data/dataSources/Remote_data_soruce_impl/auth_remote_data_source_impl.dart';
import 'package:skill_bit/features/auth/data/dataSources/Remote_data_source/auth_remote_data_source.dart';
import 'package:skill_bit/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import 'package:skill_bit/features/auth/domain/useCases/check_auth_status.dart';
import 'package:skill_bit/features/auth/domain/useCases/forgot_password.dart';
import 'package:skill_bit/features/auth/domain/useCases/log_out.dart';
import 'package:skill_bit/features/auth/domain/useCases/login.dart';
import 'package:skill_bit/features/auth/domain/useCases/resend_verification_code.dart';
import 'package:skill_bit/features/auth/domain/useCases/reset_password.dart';
import 'package:skill_bit/features/auth/domain/useCases/sign_in_with_google.dart';
import 'package:skill_bit/features/auth/domain/useCases/sign_up.dart';
import 'package:skill_bit/features/auth/domain/useCases/verify_email.dart';

import '../../../features/auth/presentation/Bloc/auth_bloc.dart';

void initAuthFeature() {
  //! Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: sl(), googleSignIn: sl()),
  );

  //! Repository
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: sl(), networkInfo: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton(() => Login(authRepo: sl()));
  sl.registerLazySingleton(() => SignUp(authRepo: sl()));
  sl.registerLazySingleton(() => Logout(authRepo: sl()));
  sl.registerLazySingleton(() => ForgotPassword(authRepo: sl()));
  sl.registerLazySingleton(() => ResetPassword(authRepo: sl()));
  sl.registerLazySingleton(() => VerifyEmail(authRepo: sl()));
  sl.registerLazySingleton(() => ResendVerificationCode(authRepo: sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(authRepo: sl()));
  sl.registerLazySingleton(() => CheckAuthStatus(authRepo: sl()));

  //! Feature Bloc
  sl.registerFactory(
    () => AuthBloc(
      login: sl(),
      signUp: sl(),
      logout: sl(),
      forgotPassword: sl(),
      resetPassword: sl(),
      verifyEmail: sl(),
      resendCode: sl(),
      googleSignIn: sl(),
    ),
  );
}
