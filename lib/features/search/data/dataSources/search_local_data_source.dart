import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:skill_bit/features/course/data/models/course_model.dart';
import 'package:skill_bit/features/course/data/models/level_model.dart';
import 'package:skill_bit/features/search/data/models/search_friends_model.dart';

abstract class SearchLocalDataSource {
  Future<List<CourseModel>> searchCourses(final String courseQuery);

  List<SearchFriendsModel> searchFriends(final String friendsQuery);
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final String _assetPath = 'assets/json/mock_courses_data.json';
  final List<SearchFriendsModel> _friends = <SearchFriendsModel>[
    SearchFriendsModel(
      name: 'Basel El Rafei',
      profileUrl: 'temp_image.png',
      scorePoints: 250,
      progress: 0.85,
    ),
    SearchFriendsModel(
      name: 'Alex Thorne',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 210,
      progress: 0.70,
    ),
    SearchFriendsModel(
      name: 'Sam Chen',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 195,
      progress: 0.45,
    ),
    SearchFriendsModel(
      name: 'Zara Khan',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 180,
      progress: 0.90,
    ),
    SearchFriendsModel(
      name: 'Elena Rodriguez',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 175,
      progress: 0.30,
    ),
    SearchFriendsModel(
      name: 'Jordan Smith',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 160,
      progress: 0.55,
    ),
    SearchFriendsModel(
      name: 'Mona Hassan',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 150,
      progress: 0.15,
    ),
    SearchFriendsModel(
      name: "Liam O'Connor",
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 140,
      progress: 0.65,
    ),
    SearchFriendsModel(
      name: 'Sophia Wang',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 130,
      progress: 0.80,
    ),
    SearchFriendsModel(
      name: 'Omar Sharif',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      scorePoints: 120,
      progress: 0.40,
    ),
  ];

  //Todo: might want to add later fuzzy package to handle search typos and find the correct query

  List<LevelModel>? _cachedLevels;

  Future<List<LevelModel>> _getAllLevels() async {
    if (_cachedLevels != null) return _cachedLevels!;
    final List<dynamic> rawJson = await _loadRawJson();
    _cachedLevels = rawJson
        .map(
          (final dynamic json) =>
              LevelModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();

    return _cachedLevels!;
  }

  @override
  Future<List<CourseModel>> searchCourses(final String courseQuery) async {
    final String query = courseQuery.trim().toLowerCase();
    final List<LevelModel> allLevels = await _getAllLevels();
    final List<CourseModel> allCourses = allLevels
        .expand((final LevelModel level) => level.courses)
        .cast<CourseModel>()
        .toList();

    if (query.isEmpty) return allCourses;

    final List<String> queryWords = query.split(' ');

    return allCourses.where((final CourseModel course) {
      final String title = course.title.toLowerCase();
      return queryWords.any((final String word) => title.contains(word));
    }).toList();
  }

  @override
  List<SearchFriendsModel> searchFriends(final String friendsQuery) {
    final String query = friendsQuery.trim().toLowerCase();
    if (query.isEmpty) return _friends;
    return _friends
        .where(
          (final SearchFriendsModel friend) =>
              friend.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  // Helpers
  Future<List<dynamic>> _loadRawJson() async {
    final String response = await rootBundle.loadString(_assetPath);
    return await jsonDecode(response) as List<dynamic>;
  }
}
