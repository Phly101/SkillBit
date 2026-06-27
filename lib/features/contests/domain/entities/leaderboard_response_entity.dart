import 'leaderboard_entity.dart';

class LeaderboardResponseEntity {
  LeaderboardResponseEntity({required this.message, required this.leaderboard});

  final String message;
  final List<LeaderboardEntity> leaderboard;
}
