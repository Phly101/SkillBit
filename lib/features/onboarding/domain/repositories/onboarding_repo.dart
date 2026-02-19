import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';

abstract class OnboardingRepo {
  Future<Either<Failure,bool>>  hasOnBoarded();
  Future<Either<Failure,void>> complete();
}