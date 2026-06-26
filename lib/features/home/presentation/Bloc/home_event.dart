part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetHomeData extends HomeEvent {
  const GetHomeData({required this.levelId});

  final int levelId;

  @override
  List<Object?> get props => <Object?>[levelId];
}
