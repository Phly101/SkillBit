import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/entities/home_entity.dart';
import 'home_course_model.dart';

class HomeDetailsModel extends HomeDetailsEntity {
  HomeDetailsModel({
    required super.courses,
    required super.userName,
    required super.imageUrl,
    required super.levelProgress,
  });

  factory HomeDetailsModel.fromJson(final Map<String, dynamic> json) {
    final dynamic dataJson = json['data'];
    final Map<String, dynamic> data = (dataJson is Map)
        ? Map<String, dynamic>.from(dataJson)
        : <String, dynamic>{};

    return HomeDetailsModel(
      userName: data['userName'] as String? ?? 'User',
      imageUrl: data['userProfilePicture'] as String?,
      courses: (data['courses'] as List<dynamic>?)
              ?.map(
                (final dynamic c) =>
                    HomeCourseModel.fromJson(c as Map<String, dynamic>),
              )
              .toList() ??
          <HomeCourseModel>[],
      levelProgress: (data['levelProgress'] as num?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': userName,
      'imageUrl': imageUrl,
      'courses': courses
          .map((final HomeCourseEntity c) => (c as HomeCourseModel).toJson())
          .toList(),
      'levelProgress': levelProgress,
    };
  }
}
