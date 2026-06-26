import '../../domain/entities/contest_details_entity.dart';

class ContestDetailsModel extends ContestDetailsEntity {
  ContestDetailsModel({
    required super.id,
    required super.remainingTime,
    required super.startingDate,
    required super.difficulty,
  });

  factory ContestDetailsModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] as Map<String, dynamic>;

    return ContestDetailsModel(
      id: data['id'] as String,
      remainingTime: Duration(milliseconds: data['remainingTime'] as int),
      startingDate: DateTime.parse(data['startingDateofContest'] as String),
      difficulty: data['difficulty'] as String,
    );
  }
}
