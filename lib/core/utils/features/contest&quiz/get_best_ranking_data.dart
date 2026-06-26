import '../../../../features/contests/domain/entities/leaderboard_entity.dart';
import '../../../../features/contests/domain/entities/podium_entity.dart';

class GetBestRankingData {
  GetBestRankingData._();

  static String getName(final dynamic item) => item is LeaderboardEntity
      ? item.fullname
      : (item as TopThreeEntity).fullname;

  static int getScore(final dynamic item) =>
      item is LeaderboardEntity ? item.score : (item as TopThreeEntity).score;

  static int getRank(final dynamic item) =>
      item is LeaderboardEntity ? item.rank : (item as TopThreeEntity).rank;

  static String getProfile(final dynamic item) => item is LeaderboardEntity
      ? item.profilePicture ?? ''
      : (item as TopThreeEntity).profilePicture;

  static String? getBadge(final dynamic item) =>
      item is LeaderboardEntity ? item.badge : (item as TopThreeEntity).badge;
}
