import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base_state.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/useCases/use_cases.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../../domain/useCases/get_profile_data.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.getProfileData}) : super(ProfileInitial()) {
    on<ProfileDetailsRequested>(_onProfileDetailsRequested);
  }

  final GetProfileData getProfileData;

  Future<void> _onProfileDetailsRequested(
    final ProfileDetailsRequested event,
    final Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final Either<Failure, UserProfileEntity> result = await getProfileData(
      const NoParams(),
    );

    result.fold(
      (final Failure failure) => emit(
        ProfileError(message: failure.message ?? 'could not get profile'),
      ),
      (final UserProfileEntity profile) => emit(ProfileSuccess(userProfile: profile)),
    );
  }
}
