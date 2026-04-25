class SettingsEntity {

  const SettingsEntity({
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.imageUrl,
  });
  final String name;
  final String email;
  final String? profileImageUrl;
  final String? imageUrl;
}
