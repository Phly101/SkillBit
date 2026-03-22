class SearchCourseEntity {

  SearchCourseEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.progress,
    required this.isLocked,
  });
  final String id;
  final String title;
  final String imageUrl;
  final double progress;
  final bool isLocked;
}

