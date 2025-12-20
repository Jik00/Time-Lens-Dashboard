import 'package:dartz/dartz.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/core/repos/era_repo/era_repo.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/era_entity.dart';

class AddEraUsecase {
  final EraRepo eraRepo;
  AddEraUsecase({required this.eraRepo});

  Future<Either<Failure, void>> call(EraEntity eraEntity) => eraRepo.addEra(eraEntity);
}