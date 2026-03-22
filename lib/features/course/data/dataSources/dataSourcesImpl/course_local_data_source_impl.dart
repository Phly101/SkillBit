import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:skill_bit/features/course/data/dataSources/course_local_data_source.dart';
import 'package:skill_bit/features/course/data/models/course_model.dart';
import 'package:skill_bit/features/course/data/models/lesson_model.dart';
import 'package:skill_bit/features/course/data/models/level_model.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import '../../../../../core/exceptions/exception.dart';

class CourseLocalDataSourceImpl implements CourseLocalDataSource {
  final String _assetPath = 'assets/json/mock_courses_data.json';

  @override
  Future<List<LevelModel>> fetchCoursesByLevel(final String levelId) async {
    try {
      print('DEBUG: Searching for Level ID: $levelId');
      final List<dynamic> data = await _loadRawJson();
      print('DEBUG: Total courses in Mock: ${data.length}');
      return data
          .where((final dynamic json) => json['id'] == levelId)
          .map(
            (final dynamic json) =>
                LevelModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e, stack) {
      print('DATA SOURCE ERROR: $e'); // This will tell us if it's a Cast error
      print('DATA SOURCE STACK: $stack');
      throw CacheException();
    }
  }

  @override
  Future<CourseModel> getCourseDetails(final String courseId) async {
    final List<dynamic> data = await _loadRawJson();
    for (final dynamic level in data) {
      for (final dynamic course in level['courses'] as List<dynamic>) {
        if (course['id'] == courseId) {
          return CourseModel.fromJson(course as Map<String, dynamic>);
        }
      }
    }
    throw CacheException();
  }

  @override
  Future<double> getCourseProgress(final String courseId) async {
    final List<dynamic> data = await _loadRawJson();
    for (final dynamic level in data) {
      for (final dynamic course in level['courses'] as List<dynamic>) {
        if (course['id'] == courseId) {
          return (course['progress'] as num).toDouble();
        }
      }
    }
    throw CacheException();
  }

  @override
  Future<LessonModel> getLessonDetails(
    final String lessonId,
    final String courseId,
  ) async {
    final Map<String, dynamic> lessonMap = await _findLessonMapInCourse(
      courseId: courseId,
      lessonId: lessonId,
    );
    return LessonModel.fromJson(lessonMap);
  }

  @override
  Future<List<CourseModel>> getLevelRoadMap() async {
    final List<dynamic> data = await _loadRawJson();
    return data.map((final dynamic json) {
      return CourseModel(
        id: json['id'] as String,
        title: json['title'] as String,
        imageUrl: json['imageUrl'] as String,
        progress: (json['progress'] as num).toDouble(),
        isLocked: json['isLocked'] as bool,
        lessons: <LessonEntity>[],
        courseType: json['courseType'],
        scoreEarned: json['scoreEarned'] as int,
      );
    }).toList();
  }

  @override
  Future<Unit> updateCourseProgress(
    final String courseId,
    final double progress,
  ) async {
    return unit;
  }

  @override
  Future<Unit> visitArticle(
    final String articleId,
    final String lessonId,
    final String courseId,
  ) async {
    final Map<String, dynamic> lessonMap = await _findLessonMapInCourse(
      courseId: courseId,
      lessonId: lessonId,
    );

    final List<dynamic> resources = lessonMap['resources'] as List<dynamic>;
    final bool exists = resources.any(
      (final dynamic res) => res['id'] == articleId,
    );

    if (!exists) {
      throw CacheException();
    }

    print('--- MOCK LOG: Tracking Progress ---');
    print('Course: $courseId | Lesson: $lessonId | Article: $articleId');
    return unit;
  }

  @override
  Future<Unit> watchVideo(
    final String videoId,
    final String lessonId,
    final String courseId,
  ) async {
    final Map<String, dynamic> lessonMap = await _findLessonMapInCourse(
      courseId: courseId,
      lessonId: lessonId,
    );

    final List<dynamic> resources = lessonMap['resources'] as List<dynamic>;
    final bool exists = resources.any(
      (final dynamic res) => res['id'] == videoId,
    );

    if (!exists) {
      throw CacheException();
    }

    print('--- MOCK LOG: Tracking Progress ---');
    print('Course: $courseId | Lesson: $lessonId | Video: $videoId');
    return unit;
  }

  // Helpers
  Future<List<dynamic>> _loadRawJson() async {
    final String response = await rootBundle.loadString(_assetPath);
    return await jsonDecode(response) as List<dynamic>;
  }

  Future<Map<String, dynamic>> _findCourseMap(final String courseId) async {
    final List<dynamic> data = await _loadRawJson();
    for (final dynamic level in data) {
      for (final dynamic course in level['courses'] as List<dynamic>) {
        if (course['id'] == courseId) return course as Map<String, dynamic>;
      }
    }
    throw CacheException();
  }

  Future<Map<String, dynamic>> _findLessonMapInCourse({
    required final String courseId,
    required final String lessonId,
  }) async {
    final Map<String, dynamic> course = await _findCourseMap(courseId);
    final List<dynamic> lessons = course['lessons'] as List<dynamic>;

    final dynamic lesson = lessons.firstWhere(
      (final dynamic lesson) => lesson['id'] == lessonId,
      orElse: () => throw CacheException(),
    );

    return lesson as Map<String, dynamic>;
  }
}
