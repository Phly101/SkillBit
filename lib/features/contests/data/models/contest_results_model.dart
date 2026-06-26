import 'package:skill_bit/features/contests/data/models/top_three_model.dart';

import '../../domain/entities/contest_results_entity.dart';
import 'my_results_model.dart';

class ContestResultsModel extends ContestResultsEntity {
  ContestResultsModel({
    required super.type,
    required super.top3,
    required super.myResult,
  });

  factory ContestResultsModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data =
        json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
    return ContestResultsModel(
      type: data['type'] as String? ?? 'global',
      top3:
          (data['top3'] as List<dynamic>?)
              ?.map(
                (final dynamic e) =>
                    TopThreeModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          <TopThreeModel>[],
      myResult: MyResultModel.fromJson(
        (data['myResult'] ?? data['myResulL']) as Map<String, dynamic>? ??
            <String, dynamic>{},
      ),
    );
  }
}
