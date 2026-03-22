import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/search/domain/repositories/search_repo.dart';
import 'package:skill_bit/features/search/domain/useCases/params/search_friends_params.dart';

import '../entities/search_friends_entity.dart';

class SearchFriendsUseCase
    implements SyncUseCase<List<SearchFriendsEntity>, SearchFriendsParams> {
  SearchFriendsUseCase(this.searchRepo);

  final SearchRepository searchRepo;

  @override
  Either<Failure, List<SearchFriendsEntity>> call(
    final SearchFriendsParams params,
  ) {
    return searchRepo.searchFriends(params.query);
  }
}
