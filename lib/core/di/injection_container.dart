import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_bit/core/router/app_router.dart';
import 'package:skill_bit/features/onboarding/data/dataSources/onboarding_local_data_source.dart';
import 'package:skill_bit/features/onboarding/data/repositories/onboarding_repo_impl.dart';
import 'package:skill_bit/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:skill_bit/features/onboarding/domain/useCases/has_on_boarded_use_case.dart';

import '../../features/onboarding/domain/useCases/complete_onboarding_use_case.dart';
import '../../features/onboarding/presentation/Bloc/onboarding_bloc.dart';
import '../../features/onboarding/presentation/Bloc/onboarding_notifier.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //! TEMP AUTH STUB
  sl.registerLazySingleton<bool Function()>(
    () =>
        () => false,
  );
  // //! TEMP
  // sl.registerLazySingleton<bool Function()>(() {
  //   final prefs = sl<SharedPreferences>();
  //   return () => prefs.getBool('onBoarded') ?? false;
  // });


  //! Onboarding
  sl.registerLazySingleton(() => OnboardingBloc(complete: sl()));
  sl.registerLazySingleton(
    () => OnboardingNotifier(sl<OnboardingBloc>().stream),
  );

  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<OnboardingRepo>(
    () => OnboardingRepoImpl(onboardingLocalDataSource: sl()),
  );

  sl.registerLazySingleton(() => HasOnBoarded(sl()));
  sl.registerLazySingleton(() => CompleteOnboardingUseCase(sl()));

  //! Core (AFTER dependencies exist)
  sl.registerLazySingleton(
    () => AppRouter(
      isLoggedIn: sl(),
      hasOnBoarded: sl(),
      onboardingBloc: sl(),
      onboardingNotifier: sl(),
    ),
  );
}
