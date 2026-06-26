class CourseIdCache {
  Map<String, String> _courseIds = <String, String>{};

  void store(final Map<String, String> map) => _courseIds = map;

  String? fetch(final String key) => _courseIds[key];
}
