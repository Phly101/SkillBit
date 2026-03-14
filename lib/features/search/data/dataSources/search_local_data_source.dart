import 'package:skill_bit/features/search/data/models/search_course_model.dart';
import 'package:skill_bit/features/search/data/models/search_friends_model.dart';

abstract class SearchLocalDataSource {
  List<SearchCourseModel> searchCourses(final String courseQuery);

  List<SearchFriendsModel> searchFriends(final String friendsQuery);
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final List<SearchCourseModel> _courses = <SearchCourseModel>[
    SearchCourseModel(
      id: '1',
      title: 'Flutter UI Masterclass',
      imageUrl: 'temp_image.png',
      progress: 85.0,
      isLocked: false,
    ),
    SearchCourseModel(
      id: '2',
      title: 'Clean Architecture in Dart',
      imageUrl: 'temp_image.png',
      progress: 40.0,
      isLocked: false,
    ),
    SearchCourseModel(
      id: '3',
      title: 'Advanced State Management',
      imageUrl: 'temp_image.png',
      progress: 0.0,
      isLocked: true,
    ),
    SearchCourseModel(
      id: '4',
      title: 'Node.js Backend Essentials',
      imageUrl: 'temp_image.png',
      progress: 10.0,
      isLocked: false,
    ),
    SearchCourseModel(
      id: '5',
      title: 'Firebase Auth & Security',
      imageUrl: 'temp_image.png',
      progress: 100.0,
      isLocked: false,
    ),
    SearchCourseModel(
      id: '6',
      title: 'Dart Design Patterns',
      imageUrl: 'temp_image.png',
      progress: 0.0,
      isLocked: true,
    ),
    SearchCourseModel(
      id: '7',
      title: 'Animations & Micro-interactions',
      imageUrl: 'temp_image.png',
      progress: 25.0,
      isLocked: false,
    ),
    SearchCourseModel(
      id: '8',
      title: 'Unit Testing Foundations',
      imageUrl: 'temp_image.png',
      progress: 60.0,
      isLocked: false,
    ),
    SearchCourseModel(
      id: '9',
      title: 'Responsive Design Strategies',
      imageUrl: 'temp_image.png',
      progress: 0.0,
      isLocked: true,
    ),
    SearchCourseModel(
      id: '10',
      title: 'Git & Team Collaboration',
      imageUrl: 'temp_image.png',
      progress: 95.0,
      isLocked: false,
    ),
  ];
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
  @override
  List<SearchCourseModel> searchCourses(final String courseQuery) {
    final String query = courseQuery.trim().toLowerCase();
    if (query.isEmpty) return _courses;
    final List<String> queryWords = query.toLowerCase().split(' ');

    return _courses.where((final SearchCourseModel course) {
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
}
