import '../../domain/entities/my_results_entity.dart';

class MyResultModel extends MyResultEntity {
  MyResultModel({
    required super.rank,
    required super.score,
    required super.fullname,
    required super.profilePicture,
    required super.badge,
  });

  factory MyResultModel.fromJson(final Map<String, dynamic> json) {
    return MyResultModel(
      rank: (json['rank'] as num?)?.toInt() ?? 0,
      score: (json['score'] as num?)?.toInt() ?? 0,
      fullname: json['fullname'] as String? ?? 'Anonymous',
      profilePicture: json['profilePicture'] as String? ?? '',
      badge: json['badge'] as String?,
    );
  }
}
