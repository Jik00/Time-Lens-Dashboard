import 'package:dartz/dartz.dart';
import 'package:timelens_dashboard/core/repos/figure_repo/figure_repo.dart';
import 'package:timelens_dashboard/features/figure_crud/domain/entities/figure_entity.dart';

import '../../../../core/errors/failures.dart';

class AddFigureUsecase {

  final FigureRepo figureRepo;

  AddFigureUsecase({required this.figureRepo});

  Future<Either<Failure, void>> call(FigureEntity figureEntity) => figureRepo.addFigure(figureEntity);
}