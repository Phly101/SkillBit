import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/onboarding/data/dataSources/onboarding_local_data_source.dart';
import 'package:skill_bit/features/onboarding/data/repositories/onboarding_repo_impl.dart';
import 'package:skill_bit/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:skill_bit/features/onboarding/domain/useCases/complete_onboarding_use_case.dart';
import 'package:skill_bit/features/onboarding/domain/useCases/has_on_boarded_use_case.dart';
import 'package:skill_bit/features/onboarding/presentation/Bloc/onboarding_bloc.dart';

void initOnboardingFeature() {
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
}
