import 'package:equatable/equatable.dart';


class QuizParams extends Equatable {
  const QuizParams({required this.id});

  final String id;

  @override
  List<Object?> get props => <Object?>[id];
}
