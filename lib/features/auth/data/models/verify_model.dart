class VerifyModel {
  const VerifyModel({required this.email, required this.code});

  final String email;
  final String code;

  Map<String, dynamic> toJson() => <String, dynamic>{'email': email, 'otp': code};
}
