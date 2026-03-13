class CourseEntity {

  CourseEntity({
    required this.title,
    required this.imageUrl,
    required this.progress,
    required this.isLocked,
  });
  final String title;
  final String imageUrl;
  final double progress;
  final bool isLocked;
}

