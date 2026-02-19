import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/core/repos/figure_repo/figure_repo.dart';
import 'package:timelens_dashboard/core/services/storage_service.dart';
import 'package:timelens_dashboard/core/services/supabase_data_service.dart';
import 'package:timelens_dashboard/features/figure_crud/domain/entities/figure_entity.dart';

import '../../../constants.dart';
import '../../../features/figure_crud/data/models/figure_model.dart';

class FigureRepoImpl implements FigureRepo {
  final StorageService storageService;
  final SupabaseDataService supaDatabaseService;

  FigureRepoImpl({
    required this.storageService,
    required this.supaDatabaseService,
  });

  @override
  Future<Either<Failure, void>> addFigure(FigureEntity figureEntity) async {
    try {
      String imageUrl = await storageService.uploadFile(
        file: figureEntity.imageFile,
        filePath: figureEntity.figureCode,
        bucketName: kSupaBucketForFigures,
        // saved inside by figureCode
      );

      // create FigureModel with imageUrl
      final model = FigureModel(
        figureName: figureEntity.figureName,
        reignPeriod: figureEntity.reignPeriod,
        reignYears: figureEntity.reignYears,
        figureCode: figureEntity.figureCode,
        imageFile: figureEntity.imageFile,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
      );

      // convert entity to model then insert into Supa
      await supaDatabaseService.addData(
          tableName: kSupaFiguresTable, data: model.toMap());

      return const Right(null);
    } on StorageException catch (e) {
      return Left(StorageFailure('Failed to upload image: ${e.message}'));
    } on PostgrestException catch (e) {
      return Left(DatabaseFailure('Database error: ${e.message}'));
    } on SocketException catch (e) {
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
