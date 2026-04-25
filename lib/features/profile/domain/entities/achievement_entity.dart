import 'package:skill_bit/features/profile/domain/enums/trophy_status.dart';
class AchievementEntity {
  const AchievementEntity({
    required this.id,
    required this.title,
    required this.url,
    required this.description,
    required this.isLocked,
    required this.status,
  });

  final String id;
  final String title;
  final String url;
  final String description;
  final bool isLocked;
  final TrophyStatus status;
}
