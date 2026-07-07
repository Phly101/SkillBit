import '../../domain/entities/podium_entity.dart';

class TopThreeModel extends TopThreeEntity {
  TopThreeModel({
    required super.score,
    required super.rank,
    required super.fullname,
    required super.profilePicture,
    required super.badge,
  });

  factory TopThreeModel.fromJson(final Map<String, dynamic> json) {
    return TopThreeModel(
      score: (json['score'] as num?)?.toInt() ?? 0,
      rank: (json['rank'] as num?)?.toInt() ?? 0,
      fullname: json['fullname'] as String? ?? 'Anonymous',
      profilePicture: json['profilePicture'] as String? ?? '',
      badge: json['badge'] as String?,
    );
  }
}
