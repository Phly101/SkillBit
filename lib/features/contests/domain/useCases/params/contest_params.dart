import 'package:equatable/equatable.dart';


class ContestParams extends Equatable {
  const ContestParams({required this.id});

  final String id;

  @override
  List<Object?> get props => <Object?>[id];
}
