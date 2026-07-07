import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/contests/domain/repositories/contest_repo.dart';
import 'package:skill_bit/features/contests/presentation/Bloc/join_contest_bloc.dart';
import '../../../features/contests/data/dataSources/contest_remote_data_sources.dart';
import '../../../features/contests/data/dataSources/contest_remote_data_sources_impl.dart';
import '../../../features/contests/data/repositories/contest_repo_impl.dart';
import '../../../features/contests/domain/useCases/contest_join.dart';
import '../../../features/contests/domain/useCases/contest_start.dart';
import '../../../features/contests/domain/useCases/contest_submit.dart';
import '../../../features/contests/domain/useCases/get_contest_details.dart';
import '../../../features/contests/domain/useCases/get_contest_results.dart';
import '../../../features/contests/domain/useCases/get_leaderboard.dart';
import '../../../features/contests/domain/useCases/review_contest_answers.dart';
import '../../../features/contests/presentation/Bloc/contest_bloc.dart';

void initContestFeature() {
  //! Data Sources

  sl.registerLazySingleton<ContestRemoteDataSources>(
    () => ContestRemoteDataSourcesImpl(apiClient: sl()),
  );

  //! Repository
  sl.registerLazySingleton<ContestRepository>(
    () => ContestRepoImpl(contestRemoteDataSources: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton(() => ContestStart(contestRepo: sl()));
  sl.registerLazySingleton(() => ContestSubmit(contestRepo: sl()));
  sl.registerLazySingleton(() => GetContestDetails(contestRepo: sl()));
  sl.registerLazySingleton(() => ReviewContestAnswers(contestRepository: sl()));
  sl.registerLazySingleton(() => GetLeaderBoardData(contestRepo: sl()));
  sl.registerLazySingleton(() => GetContestResults(contestRepo: sl()));
  sl.registerLazySingleton(() => JoinContest(contestRepo: sl()));

  //! Feature Bloc
  sl.registerFactory(
    () => ContestBloc(
      getDetailsUseCase: sl(),
      startContestUseCase: sl(),
      submitContestUseCase: sl(),
      reviewContestUseCase: sl(),
      getLeaderBoardData: sl(),
      getContestResults: sl(),
    ),
  );
  sl.registerFactory(() => JoinContestBloc(joinContestUseCase: sl()));
}
