class LeaderboardEntity {
  LeaderboardEntity({
    required this.userId,
    required this.name,
    required this.profileUrl,
    required this.score,
    required this.rank,
    required this.badgeIcon,
    this.inPodium = false,
  });

  final String name;
  final String userId;
  final String profileUrl;
  final int score;
  final String rank;
  final String badgeIcon;
  final bool inPodium;
}


