import '../../domain/entities/profile_picture_entity.dart';

class ProfilePictureModel extends ProfilePictureEntity {
  const ProfilePictureModel({required super.profilePicture});

  factory ProfilePictureModel.fromJson(final Map<String, dynamic> json) {
    return ProfilePictureModel(
      profilePicture: json['profilePicture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'profilePicture': profilePicture};
  }
}
