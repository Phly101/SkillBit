import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/useCases/check_auth_status.dart';
import '../../features/onboarding/domain/useCases/has_on_boarded_use_case.dart';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier({
    required this.hasOnBoardedUseCase,
    required this.checkAuthStatusUseCase,
  });

  final HasOnBoarded hasOnBoardedUseCase;
  final CheckAuthStatus checkAuthStatusUseCase;

  bool _isInitialized = false;
  bool _isOnboarded = false;
  bool _isLoggedIn = false;

  bool get isInitialized => _isInitialized;

  bool get isOnboarded => _isOnboarded;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> initializeApp() async {
    final Stopwatch stopwatch = Stopwatch()..start();

    // 1. Check onboarding
    final Either<Failure, bool> onboardingResult = await hasOnBoardedUseCase(
      const NoParams(),
    );
    _isOnboarded = onboardingResult.getOrElse(() => false);

    // 2. Check login status using the UseCase
    final Either<Failure, bool> result = await checkAuthStatusUseCase(
      const NoParams(),
    );
    result.fold((final Failure failure) {}, (final bool isLoggedIn) {
      _isLoggedIn = isLoggedIn;
    });

    // 3. Ensure minimum splash screen duration
    const int minSplashMs = 800;
    final int elapsed = stopwatch.elapsedMilliseconds;
    if (elapsed < minSplashMs) {
      await Future<void>.delayed(
        Duration(milliseconds: minSplashMs - elapsed),
      );
    }

    _isInitialized = true;
    notifyListeners();
  }

  // Called when onboarding finishes
  void setOnboarded() {
    _isOnboarded = true;
    notifyListeners();
  }

  void setLoggedIn() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
