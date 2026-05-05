import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_bit/core/app_state/app_state_notifier.dart';
import 'package:skill_bit/core/di/injectors/auth_injector.dart';
import 'package:skill_bit/core/di/injectors/course_injector.dart';
import 'package:skill_bit/core/di/injectors/home_injector.dart';
import 'package:skill_bit/core/di/injectors/onboarding_injector.dart';
import 'package:skill_bit/core/di/injectors/search_injector.dart';
import 'package:skill_bit/core/network/api_client.dart';
import 'package:skill_bit/core/network/dio_client.dart';
import 'package:skill_bit/core/network/network_info.dart';
import 'package:skill_bit/core/network/network_info_impl.dart';
import 'package:skill_bit/core/router/app_router.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! External (Global dependencies)
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);

  //! Core
  sl.registerLazySingleton<ApiClient>(() => DioClient(sl<Dio>()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! Features
  initAuthFeature();
  initHomeFeature();
  initCourseFeature();
  initSearchFeature();
  initOnboardingFeature();

  //! App State (Core logic that spans features)
  sl.registerLazySingleton<AppStateNotifier>(
    () => AppStateNotifier(
      hasOnBoardedUseCase: sl(),
      checkAuthStatusUseCase: sl(),
    ),
  );

  //! Router
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(appStateNotifier: sl(), onboardingBloc: sl()),
  );
}
