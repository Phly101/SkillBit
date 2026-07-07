import 'package:skill_bit/features/contests/domain/entities/podium_entity.dart';

import 'my_results_entity.dart';

class ContestResultsEntity {
  ContestResultsEntity({
    required this.type,
    required this.top3,
    required this.myResult,
  });

  final String type;
  final List<TopThreeEntity> top3;
  final MyResultEntity myResult;
}
