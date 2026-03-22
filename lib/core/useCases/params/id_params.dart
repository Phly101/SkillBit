import 'package:equatable/equatable.dart';

class IdParams extends Equatable {
  const IdParams({required this.id});

  final String id;

  @override
  List<Object?> get props => <Object?>[id];
}
