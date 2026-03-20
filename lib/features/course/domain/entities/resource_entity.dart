import 'enums/resource_type.dart';

class ResourceEntity {
  ResourceEntity({required this.id, required this.type, required this.url});

  final String id;
  final ResourceType type;
  final String url;
}
