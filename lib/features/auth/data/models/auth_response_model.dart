class AuthResponseModel {
  const AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.id,
    this.isVerified,
  });

  factory AuthResponseModel.fromJson(final Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: (json['access_token'] ?? json['accessToken'] ?? '')
          .toString(),
      refreshToken: (json['refresh_token'] ?? json['refreshToken'] ?? '')
          .toString(),
      id: (json['id'] ?? json['user_id'] ?? ''),
      isVerified: json['is_verified'] ?? json['isVerified'],
    );
  }

  final String accessToken;
  final String refreshToken;
  final String? id;
  final bool? isVerified;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'id': id,
    'is_verified': isVerified,
  };
}
