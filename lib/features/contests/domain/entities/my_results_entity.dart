class MyResultEntity {
  MyResultEntity({
    required this.rank,
    required this.score,
    required this.fullname,
    required this.profilePicture,
    required this.badge,
  });

  final int rank;
  final int score;
  final String fullname;
  final String profilePicture;
  final String? badge;
}