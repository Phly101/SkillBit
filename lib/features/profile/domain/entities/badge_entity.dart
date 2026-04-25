

class BadgeEntity {
  const BadgeEntity({
    required this.id,
    required this.url,
    required this.description,
    required this.isLocked,
  });

  final String id;
  final String url;
  final String description;
  final bool isLocked;
}
