import 'package:dartz/dartz.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/era_crud/domain/repos/era_repo.dart';

class GetErasUsecase {
  final EraRepo eraRepo;

  GetErasUsecase({required this.eraRepo});

  Future <Either <Failure, List<EraEntity>>> call () => eraRepo.getAllEras();
  
}