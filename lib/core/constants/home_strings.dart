class HomeStrings {
  HomeStrings._();

  static String greeting(final String name) => 'Hello,$name';

  //Todo: just for now until the data of levels can be obtained from the back end
  static const Map<String, int> levels = <String, int>{
    'Level1': 4,
    'Level2': 8,
    'Level3': 7,
  };

  static const String assessmentExam = 'Want to know your level?';

  // Names:
  static const String explore = 'Explore Courses';
  static const String search = 'Search';
  static const String home = 'Home';
  static const String library = 'Library';
  static const String myAgenda = 'My agenda';
  static const String profile = 'Profile';
  static const String lvl1 = 'Level 1';
  static const String lvl2 = 'Level 2';
  static const String lvl3 = 'Level 3';
}
