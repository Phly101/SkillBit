import 'package:equatable/equatable.dart';

class VerificationParams extends Equatable {
  const VerificationParams({required this.code, required this.email});
 final String email;
  final String code;

  @override
  List<Object?> get props => <Object?>[code,email];
}
