class LeaderboardEntity {
  LeaderboardEntity({
    required this.fullname,
    required this.score,
    required this.rank,
    required this.badge,
    required this.profilePicture,
  });

  final String fullname;
  final String? profilePicture;
  final int score;
  final int rank;
  final String? badge;
}
