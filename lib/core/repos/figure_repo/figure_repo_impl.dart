import 'package:dartz/dartz.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/core/repos/figure_repo/figure_repo.dart';
import 'package:timelens_dashboard/core/services/storage_service.dart';
import 'package:timelens_dashboard/features/figure_crud/data/data_sources/supa_figure_data_source.dart';
import 'package:timelens_dashboard/features/figure_crud/domain/entities/figure_entity.dart';

class FigureRepoImpl implements FigureRepo {
  final StorageService storageService;
  final SupabaseFigureDataSource supaFigureDataSource;

  FigureRepoImpl({
    required this.storageService,
    required this.supaFigureDataSource,
  });

  @override
  Future<Either<Failure, void>> addFigure(FigureEntity figureEntity) {
    // TODO: implement addFigure
    throw UnimplementedError();
  }
}
