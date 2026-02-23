import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:skill_bit/core/router/app_router.dart';
import 'package:skill_bit/core/app_state/app_state_notifier.dart';

import 'package:skill_bit/features/onboarding/data/dataSources/onboarding_local_data_source.dart';
import 'package:skill_bit/features/onboarding/data/repositories/onboarding_repo_impl.dart';
import 'package:skill_bit/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:skill_bit/features/onboarding/domain/useCases/has_on_boarded_use_case.dart';
import 'package:skill_bit/features/onboarding/domain/useCases/complete_onboarding_use_case.dart';
import 'package:skill_bit/features/onboarding/presentation/Bloc/onboarding_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //! Data Sources
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Repository
  sl.registerLazySingleton<OnboardingRepo>(
    () => OnboardingRepoImpl(onboardingLocalDataSource: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton<HasOnBoarded>(() => HasOnBoarded(sl()));

  sl.registerLazySingleton<CompleteOnboardingUseCase>(
    () => CompleteOnboardingUseCase(sl()),
  );

  //! Feature Bloc
  sl.registerFactory<OnboardingBloc>(() => OnboardingBloc(complete: sl()));

  //! App State
  sl.registerLazySingleton<AppStateNotifier>(
    () => AppStateNotifier(hasOnBoardedUseCase: sl()),
  );

  //! Router
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(appStateNotifier: sl(), onboardingBloc: sl()),
  );
}
