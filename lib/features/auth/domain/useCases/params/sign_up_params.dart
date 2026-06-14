import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword,
    this.role,
  });

  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String? role;

  @override
  List<Object?> get props => <Object?>[email, password, name,confirmPassword,role];
}
