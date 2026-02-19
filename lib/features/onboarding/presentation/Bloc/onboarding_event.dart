part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}
class  CompleteOnboardingPressed extends OnboardingEvent {
  const CompleteOnboardingPressed();

  @override

  List<Object?> get props =><Object?>[];
}
