import 'package:equatable/equatable.dart';

class LevelParams extends Equatable {
  const LevelParams({required this.levelIndex});

  final int levelIndex;

  @override
  List<Object?> get props => <Object?>[levelIndex];
}
