import 'package:dartz/dartz.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/features/era_crud/domain/repos/era_repo.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';

class AddEraUsecase {
  final EraRepo eraRepo;
  AddEraUsecase({required this.eraRepo});

  Future<Either<Failure, void>> call(EraEntity eraEntity) => eraRepo.addEra(eraEntity);
}