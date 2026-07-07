import 'package:skill_bit/features/course/domain/entities/resource_entity.dart';

class MaterialModel extends MaterialEntity {
  MaterialModel({required super.url});

  factory MaterialModel.fromJson(final Map<String, dynamic> json) {
    return MaterialModel(url: json['url'] as String? ?? '');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'url': url};
  }
}
