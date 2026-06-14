class SignupModel {
  const SignupModel({
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword,
    this.role = 'user',
  });

  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String role;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'fullname': name,
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword,
    'role': role,
  };
}
