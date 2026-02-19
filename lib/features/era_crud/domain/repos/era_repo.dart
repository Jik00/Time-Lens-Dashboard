import 'package:dartz/dartz.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';

abstract class EraRepo {
  Future<Either<Failure, void>> addEra(EraEntity era);
}
