class SettingsEntity {

  const SettingsEntity({
    required this.fullname,
    required this.email,
    this.profilePicture,
  });
  final String fullname;
  final String email;
  final String? profilePicture;
}
