class ResetPassModel {
  const ResetPassModel({
    required this.email,
    required this.code,
    required this.newPassword,
  });

  final String email;
  final String code;
  final String newPassword;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'email': email,
    'otp': code,
    'newPassword': newPassword,
  };
}
