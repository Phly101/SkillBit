import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/search/data/dataSources/search_local_data_source.dart';
import 'package:skill_bit/features/search/domain/entities/search_friends_entity.dart';
import 'package:skill_bit/features/search/domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepository {
  const SearchRepoImpl({required this.searchLocalDataSource});

  final SearchLocalDataSource searchLocalDataSource;

  @override
  Future<Either<Failure, List<CourseEntity>>> searchCourses(
    final String courseQuery,
  ) async {
    try {
      final List<CourseEntity> result =  await searchLocalDataSource
          .searchCourses(courseQuery);
      return Right<Failure, List<CourseEntity>>(result);
    } catch (e) {
      return Left<Failure, List<CourseEntity>>(CacheFailures());
    }
  }

  @override
  Either<Failure, List<SearchFriendsEntity>> searchFriends(
    final String friendsQuery,
  ) {
    try {
      final List<SearchFriendsEntity> result = searchLocalDataSource
          .searchFriends(friendsQuery);
      return Right<Failure, List<SearchFriendsEntity>>(result);
    } catch (e) {
      return Left<Failure, List<SearchFriendsEntity>>(CacheFailures());
    }
  }
}
