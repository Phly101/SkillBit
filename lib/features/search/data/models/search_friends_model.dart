import 'package:skill_bit/features/search/domain/entities/search_friends_entity.dart';

class SearchFriendsModel extends SearchFriendsEntity {
  SearchFriendsModel({
    required super.name,
    required super.profileUrl,
    required super.scorePoints,
    required super.progress,
  });

  factory SearchFriendsModel.fromEntity(final SearchFriendsEntity entity) {
    return SearchFriendsModel(
      name: entity.name,
      profileUrl: entity.profileUrl,
      scorePoints: entity.scorePoints,
      progress: entity.progress,
    );
  }

  //Decoder
  factory SearchFriendsModel.fromJson(final Map<String, dynamic> json) {
    return SearchFriendsModel(
      name: json['name'] as String? ?? 'guest',
      profileUrl:
          json['profileUrl'] as String? ?? 'assets/icons/placeholder.jpg',
      scorePoints: json['scorePoints'] as int? ?? 0,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // Encoder
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'profileUrl': profileUrl,
      'scorePoints': scorePoints,
      'progress': progress,
    };
  }
}
