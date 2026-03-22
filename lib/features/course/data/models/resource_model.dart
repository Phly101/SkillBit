import 'package:skill_bit/features/course/domain/entities/resource_entity.dart';

import '../../domain/entities/enums/resource_type.dart';

class ResourceModel extends ResourceEntity {
  ResourceModel({required super.type, required super.url, required super.id});

  factory ResourceModel.fromJson(final Map<String, dynamic> json) {
    return ResourceModel(
      id: json['id'],
      type: ResourceType.values.firstWhere(
        (final ResourceType e) =>
            e.name.toLowerCase() == json['type'].toString().toLowerCase(),
        orElse: () => ResourceType.other,
      ),
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'type': type.name, 'url': url};
  }
}
