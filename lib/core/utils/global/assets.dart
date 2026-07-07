class Assets {
  Assets._();

  static String image(final String name) => 'assets/images/$name';

  static String imageLogo(final String name) => 'assets/images/logos/$name';

  static String imageCourse(final String name) =>
      'assets/images/course_images/$name';

  static String icon(final String name) => 'assets/icons/$name';

  static String badge(final String name) {
    // Map common names/typos to actual file names
    String fileName = name;
    if (name.toLowerCase() == 'beginner') {
      fileName = 'bigenner';
    }
    return 'assets/icons/badges/${fileName.endsWith('.png') ? fileName : '$fileName.png'}';
  }

  static String animation(final String name) => 'assets/animations/$name';
}
