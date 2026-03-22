part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData({required this.levelId});

  final String levelId;

  @override
  List<Object?> get props => <Object?>[levelId];
}
