import 'package:skill_bit/features/settings/domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntity {
  const SettingsModel({
    required super.fullname,
    required super.email,
    required super.profilePicture,
  });

  factory SettingsModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] as Map<String, dynamic>;
    return SettingsModel(
      fullname: data['fullname'] as String,
      email: data['email'] as String,
      profilePicture: data['profilePicture'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'profilePicture': profilePicture,
    };
  }
}
