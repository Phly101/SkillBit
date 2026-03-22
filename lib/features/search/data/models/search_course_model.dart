import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';

class SearchCourseModel extends SearchCourseEntity {
  SearchCourseModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.progress,
    required super.isLocked,
  });

  factory SearchCourseModel.fromEntity(final SearchCourseEntity entity) {
    return SearchCourseModel(
      id: entity.id,
      title: entity.title,
      imageUrl: entity.imageUrl,
      progress: entity.progress,
      isLocked: entity.isLocked,
    );
  }

  // Decoder
  factory SearchCourseModel.fromJson(final Map<String, dynamic> json) {
    return SearchCourseModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? 'Unknown Course',
      imageUrl: json['imageUrl'] as String? ?? 'assets/icons/placeholder.jpg',
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      isLocked: json['isLocked'] as bool? ?? false,
    );
  }

  //Encoder
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'progress': progress,
      'isLocked': isLocked,
    };
  }
}
