import 'package:flutter/material.dart';
// import 'package:dartz/dartz.dart';
// import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import '../../features/onboarding/domain/useCases/has_on_boarded_use_case.dart';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier({
    required this.hasOnBoardedUseCase,
  });

  final HasOnBoarded hasOnBoardedUseCase;

  bool _isInitialized = false;
  bool _isOnboarded = false;
  bool _isLoggedIn = false;

  bool get isInitialized => _isInitialized;
  bool get isOnboarded => _isOnboarded;
  bool get isLoggedIn => _isLoggedIn;


  Future<void> initializeApp() async {
    final Stopwatch stopwatch = Stopwatch()..start();

    // Check onboarding status
//    final Either<Failure, bool> result =
    await hasOnBoardedUseCase(const NoParams());

    // _isOnboarded = result.getOrElse(() => false);
    _isOnboarded = false;

    //  until auth domain exists
    _isLoggedIn = false;

    _isInitialized = true;

    const int minSplashMs = 800;

    final int elapsed = stopwatch.elapsedMilliseconds;

    if (elapsed < minSplashMs) {
      await Future.delayed(
        Duration(milliseconds: minSplashMs - elapsed),
      );
    }
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