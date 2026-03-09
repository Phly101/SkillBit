class AppRoutes {
  AppRoutes._();

  //? splash screen
  static const String splash = '/';

  //? onBoarding
  static const String onBoarding = '/onBoarding';

  //? Authentication Screens
  static const String signUp = '/signUp';
  static const String login = '/login';
  static const String verification = '/verification';
  static const String forgotPassword = '/forgotPassword';
  static const String newPassword = '/NewPassword';

  //? Home Screen
  static const String home = '/home';

  //? Assessment screen
  static const String assessment = '/assessment';

  //? Course screens
  static const String course = '/course';
  static const String playList = '/playList';
  static const String lessonQuiz = '/lessonQuiz';
  static const String quizResults = '/quizResults';
  static const String lessonQuizAnswers =
      '/lessonQuizAnswers'; // not sure about it yet...

  //? agenda screens
  static const String agenda = '/agenda';

  //? notifications screens
  static const String notifications = '/notifications';

  //? profile screens
  static const String profile = '/profile';
  static const String badges = 'badges';
  static const String achievement = 'achievement';
  static const String contactUs = 'contactUs';
  static const String aboutUs = 'aboutUs';
  static const String settings = 'settings';

  //? Contest screens
  static const String contestDetails = '/contestDetails';
  static const String contestPage = '/contestPage';
  static const String contestResults = '/contestResults';
  static const String contestReview = '/contestReview';
  static const String contestLeaderboards = '/contestLeaderBoards';
}
