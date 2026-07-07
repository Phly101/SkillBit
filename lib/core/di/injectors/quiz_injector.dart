import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/quiz/data/dataSources/quiz_remote_data_source_impl.dart';
import 'package:skill_bit/features/quiz/data/dataSources/quiz_remote_data_sources.dart';
import 'package:skill_bit/features/quiz/data/repositories/quiz_repo_impl.dart';
import 'package:skill_bit/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:skill_bit/features/quiz/domain/useCases/review_answers.dart';
import 'package:skill_bit/features/quiz/domain/useCases/start_quiz.dart';
import 'package:skill_bit/features/quiz/domain/useCases/submit_quiz.dart';
import 'package:skill_bit/features/quiz/presentation/Bloc/quiz_bloc.dart';

void initQuizFeature() {
  //! Data Sources
  sl.registerLazySingleton<QuizRemoteDataSources>(
    () => QuizRemoteDataSourceImpl(apiClient: sl()),
  );

  //! Repository
  sl.registerLazySingleton<QuizRepository>(
    () => QuizRepoImpl(
      quizRemoteDataSource: sl(),
    ),
  );

  //! Use Cases
  sl.registerLazySingleton(() => AttemptQuiz(quizRepository: sl()));
  sl.registerLazySingleton(() => SubmitQuiz(quizRepository: sl()));
  sl.registerLazySingleton(() => ReviewAnswers(quizRepository: sl()));

  //! Feature Bloc
  sl.registerFactory(
    () => QuizBloc(
      attemptQuiz: sl(),
      submitQuiz: sl(),
      reviewAnswers: sl(),
    ),
  );
}
