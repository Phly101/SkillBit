import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams({
    required this.email,
    required this.code,
    required this.newPassword,
  });

  final String email;
  final String code;
  final String newPassword;

  @override
  List<Object?> get props => <Object?>[email, code, newPassword];
}
