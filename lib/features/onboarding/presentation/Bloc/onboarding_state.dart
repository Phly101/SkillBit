part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
}

final class OnboardingInitial extends OnboardingState {
  @override
  List<Object> get props => <Object>[];
}

final class OnboardingLoading extends OnboardingState {
  @override
  List<Object> get props => <Object>[];
}

final class OnboardingSuccess extends OnboardingState {
  @override
  List<Object> get props => <Object>[];
}

final class OnboardingError extends OnboardingState {
  const OnboardingError({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}
