import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract interface class UseCase<T, Params extends Equatable> {
  Future<Either<Failure, T>> call(final Params params);
}

abstract interface class SyncUseCase<T, Params extends Equatable> {
  Either<Failure, T> call(final Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => <Object?>[];
}
