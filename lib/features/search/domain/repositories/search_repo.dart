import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';
import 'package:skill_bit/features/search/domain/entities/search_friends_entity.dart';

abstract class SearchRepository {
  Either<Failure, List<SearchCourseEntity>> searchCourses(
    final String courseQuery,
  );

  Either<Failure, List<SearchFriendsEntity>> searchFriends(
    final String friendsQuery,
  );
}
