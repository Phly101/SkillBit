class ApiEndpoints {
  ApiEndpoints._();

  static String baseUrl = 'https://skillbit-production-0096.up.railway.app/';

  // Auth End points
  static String signUp = 'auth/signup';
  static String login = 'auth/login';
  static String refresh = 'auth/refresh';
  static String signInWithGoogle = 'auth/google-login';
  static String forgotPassword = 'auth/forgot-password';
  static String resetPassword = 'auth/reset-password';
  static String verifyEmail = 'auth/confirm-email';
  static String reSendOTP = 'auth/resend-otp';

  // Course End points
  static String getCoursesByLevel(final String levelId) => 'courses?$levelId';

  static String getCourseById(final String courseId) => 'courses/$courseId';

  static String enrollCourse(final String courseId) =>
      'courses/enroll/$courseId';

  static String finishCourse(final String courseId) =>
      'courses/finish/$courseId';

  // lessons endpoint
  static String getLessonWithQuiz(final String lessonId) => 'lessons/$lessonId';

  // home endpoint
  static String getUserHomeScreenData(final String levelId) =>
      'courses/home?level=$levelId';

  // quiz endpoint
  static String startQuiz(final String quizId) => 'quiz/start/$quizId';
  static String submitQuiz = 'quiz/submit';

  static String getQuizAnswers(final String quizId) => 'quiz/results/$quizId';

  // contest endpoint
  static String submitContest = 'contest/submit';

  static String startContest(final String contestId) =>
      'contest/start/$contestId';

  static String getContestDetails = 'contest/details/';

  static String getContestAnswers(final String contestId) =>
      'contest/answers/$contestId';
  static String getContestLeaderBoard = 'leaderboard';

  static String getContestResults(final String contestId) =>
      'contest/results/$contestId';

  static String joinContest(final String contestId) =>
      'contest/join/$contestId';

  // settings endpoint
  static String getSettings= 'user/my-profile';
  static String uploadImage() => 'user/upload-profile-picture';


  // profile endpoint
  static String getProfile() => 'user/my-profile';
}
