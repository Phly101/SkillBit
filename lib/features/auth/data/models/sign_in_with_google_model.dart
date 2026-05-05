class SignInWithGoogleModel {
  const SignInWithGoogleModel({required this.idToken});

  final String? idToken;

  Map<String, dynamic> toJson() => <String, dynamic>{'idToken': idToken};
}
