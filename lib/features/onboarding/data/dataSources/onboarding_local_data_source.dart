import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> hasCompletedOnboarding();

  Future<void> completeOnboarding();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;
  static const String ONBOARDING_KEY = 'has_onboarded';

  @override
  Future<bool> hasCompletedOnboarding() async =>
      sharedPreferences.getBool(ONBOARDING_KEY) ?? false;

  @override
  Future<void> completeOnboarding() async {
    await sharedPreferences.setBool(ONBOARDING_KEY, true);
  }
}
