import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import '../../domain/useCases/complete_onboarding_use_case.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required this.complete}) : super(OnboardingInitial()) {
    on<CompleteOnboardingPressed>(_onCompleted);
  }

  Future<void> _onCompleted(
    final CompleteOnboardingPressed event,
    final Emitter<OnboardingState> emit,
  ) async {
    emit(OnboardingLoading());
    final Either<Failure, void> result = await complete(const NoParams());

    result.fold(
      // fail state
      (final Failure failure) =>
          emit(const OnboardingError(message: 'Failed to Save onBoarding')),


      // success state
      (_) => emit(OnboardingSuccess()),
    );
  }

  // our use cases
  final CompleteOnboardingUseCase complete;
}
