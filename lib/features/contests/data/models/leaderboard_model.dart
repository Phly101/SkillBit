import '../../domain/entities/leaderboard_entity.dart';
import '../../domain/entities/leaderboard_response_entity.dart';

class LeaderboardModel extends LeaderboardEntity {
  LeaderboardModel({
    required super.fullname,
    required super.score,
    required super.rank,
    required super.badge,
    required super.profilePicture,
  });

  factory LeaderboardModel.fromJson(final Map<String, dynamic> json) {
    return LeaderboardModel(
      fullname: json['fullname'] as String? ?? 'Anonymous',
      profilePicture: json['profilePicture'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
      rank: (json['rank'] as num?)?.toInt() ?? 0,
      badge: json['badge'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullname': fullname,
      'profilePicture': profilePicture,
      'score': score,
      'rank': rank,
      'badge': badge,
    };
  }
}

class LeaderboardResponseModel extends LeaderboardResponseEntity {

  LeaderboardResponseModel({
    required super.message,
    required super.leaderboard,
  });

  factory LeaderboardResponseModel.fromJson(final Map<String, dynamic> json) {
    return LeaderboardResponseModel(
      message: json['message'] as String,
      leaderboard: (json['leaderboard'] as List<dynamic>)
          .map(
            (final dynamic e) =>
                LeaderboardModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

}
