class SettingsEntity {

  const SettingsEntity({
    required this.name,
    required this.email,
    this.profileImageUrl,
  });
  final String name;
  final String email;
  final String? profileImageUrl;
}
