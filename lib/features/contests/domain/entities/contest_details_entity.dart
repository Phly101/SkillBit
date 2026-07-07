class ContestDetailsEntity {
  ContestDetailsEntity({
    required this.id,
    required this.remainingTime,
    required this.startingDate,
    required this.difficulty,
  });

  final String id;
  final Duration remainingTime;
  final DateTime startingDate;
  final String difficulty;
}