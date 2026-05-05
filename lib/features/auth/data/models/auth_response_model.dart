class AuthResponseModel {
  const AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.id,
  });

  factory AuthResponseModel.fromJson(final Map<String, dynamic> json) =>
      AuthResponseModel(
        accessToken: json['access_token'],
        refreshToken: json['refreshToken'],
        id: json['id'] as String?,
      );
  final String accessToken;
  final String refreshToken;
  final String? id;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'id':id,
  };
}
