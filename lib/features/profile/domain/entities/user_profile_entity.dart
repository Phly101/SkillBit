class UserProfileEntity {
  UserProfileEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.profilePicture,
    required this.level,
    required this.score,
    required this.rank,
    required this.isVerified,
    this.earnedBadges = const [],
    this.earnedAchievements = const [],
  });

  final String id;
  final String fullName;
  final String email;
  final String role;
  final String? profilePicture;
  final int level;
  final int score;
  final String rank;
  final bool isVerified;
  final List<dynamic> earnedBadges;
  final List<dynamic> earnedAchievements;
}
