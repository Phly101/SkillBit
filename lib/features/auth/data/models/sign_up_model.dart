class SignupModel {
  const SignupModel({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'email': email,
    'password': password,
    'name': name,
  };
}
