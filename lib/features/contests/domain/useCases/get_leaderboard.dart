import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/contests/domain/entities/leaderboard_response_entity.dart';

import '../repositories/contest_repo.dart';

class GetLeaderBoardData
    implements UseCase<LeaderboardResponseEntity, NoParams> {
  GetLeaderBoardData({required this.contestRepo});

  final ContestRepository contestRepo;

  @override
  Future<Either<Failure, LeaderboardResponseEntity>> call(
    final NoParams params,
  ) {
    return contestRepo.getLeaderBoardData();
  }
}
