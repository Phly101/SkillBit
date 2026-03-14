import 'package:skill_bit/core/di/injectors/search_injector.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_state/app_state_notifier.dart';
import '../router/app_router.dart';
import 'injectors/onboarding_injector.dart';


final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! External (Global dependencies)
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //! Features
  initSearchFeature();
  initOnboardingFeature();


  //! App State (Core logic that spans features)
  sl.registerLazySingleton<AppStateNotifier>(
    () => AppStateNotifier(hasOnBoardedUseCase: sl()),
  );

  //! Router
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(appStateNotifier: sl(), onboardingBloc: sl()),
  );
}
