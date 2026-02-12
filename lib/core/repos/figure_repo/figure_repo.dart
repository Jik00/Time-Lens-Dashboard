import 'package:dartz/dartz.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/features/figure_crud/domain/entities/figure_entity.dart';

abstract class FigureRepo {
  Future<Either<Failure, void>> addFigure(FigureEntity figureEntity);
}