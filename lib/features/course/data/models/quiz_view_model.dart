import 'package:skill_bit/features/course/domain/entities/quiz_view_entity.dart';

import '../../domain/entities/enums/quiz_status.dart';

class QuizViewModel extends QuizViewEntity {
  QuizViewModel({
    required super.title,
    required super.id,
    required super.isLocked,
    required super.status,
    super.difficulty,
    super.timeLimit,
    super.passingScore,
  });

  factory QuizViewModel.fromJson(final Map<String, dynamic> json) {
    return QuizViewModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as String? ?? json['_id'] as String? ?? '',
      isLocked: json['isLocked'] as bool? ?? false,
      difficulty: json['difficulty'] as String?,
      timeLimit: (json['timeLimit'] as num?)?.toInt(),
      passingScore: (json['passingScore'] as num?)?.toInt(),
      status: QuizStatus.values.firstWhere(
        (final dynamic e) => e.toString().split('.').last == json['status'],
        orElse: () => QuizStatus.unknown,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'title': title, 'isLocked': isLocked};
  }
}
