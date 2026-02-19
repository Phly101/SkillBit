import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_bloc.dart';

class OnboardingNotifier extends ChangeNotifier {
  bool _localOnboarded = false;
  bool get onboarded => _localOnboarded;
  OnboardingNotifier(final Stream<OnboardingState> stream) {

    _subscription = stream.listen((final OnboardingState state) {
      if (state is OnboardingSuccess) {
        _localOnboarded = true;
        notifyListeners();
      }
    });
  }
  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}