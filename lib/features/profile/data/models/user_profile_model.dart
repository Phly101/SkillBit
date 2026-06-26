import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.role,
    required super.profilePicture,
    required super.level,
    required super.score,
    required super.rank,
    required super.isVerified,
    super.earnedBadges,
    super.earnedAchievements,
  });

  factory UserProfileModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] as Map<String, dynamic>;
    return UserProfileModel(
      id: data['id'] as String? ?? data['_id'] as String? ?? '',
      fullName: data['fullname'] as String? ?? '',
      email: data['email'] as String? ?? '',
      role: data['role'] as String? ?? '',
      profilePicture: data['profilePicture'] as String?,
      level: (data['level'] as num?)?.toInt() ?? 0,
      score: (data['score'] as num?)?.toInt() ?? 0,
      rank: data['rank'] as String? ?? '',
      isVerified: data['isVerified'] as bool? ?? false,
      earnedBadges: data['earnedBadges'] as List<dynamic>? ?? [],
      earnedAchievements: data['earnedAchievements'] as List<dynamic>? ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullName,
      'email': email,
      'role': role,
      'profilePicture': profilePicture,
      'level': level,
      'score': score,
      'rank': rank,
      'isVerified': isVerified,
      'earnedBadges': earnedBadges,
      'earnedAchievements': earnedAchievements,
    };
  }
}
