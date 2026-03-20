import 'package:skill_bit/features/course/domain/entities/level_entity.dart';

import 'course_model.dart';

class LevelModel extends LevelEntity {
  LevelModel({
    required super.id,
    required super.levelIndex,
    required super.title,
    required super.courses,
  });

  factory LevelModel.fromJson(final Map<String, dynamic> json) {
    return LevelModel(
      id: json['id'],
      levelIndex: json['levelIndex'],
      title: json['title'],
      courses: (json['courses'] as List<dynamic>)
          .map((final dynamic c) => CourseModel.fromJson(c))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'levelIndex': levelIndex,
      'courses': courses,
    };
  }
}
