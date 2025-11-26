import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/core/repos/era_repo/era_repo.dart';
import 'package:timelens_dashboard/core/services/storage_service.dart';
import 'package:timelens_dashboard/features/add_era/data/data_sources/supa_era_data_source.dart';
import 'package:timelens_dashboard/features/add_era/data/models/era_model.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/era_entity.dart';

class EraRepoImpl implements EraRepo {
  final StorageService storageService;
  final SupabaseEraDataSource dataSource; 

  EraRepoImpl({required this.dataSource, 
    required this.storageService,
  });

  @override
  Future<Either<Failure, void>> addEra(EraEntity eraEntity) async {
    try {

      String imageUrl = await storageService.uploadFile(
        eraEntity.imageFile,
        eraEntity.eraCode, // saved inside by eraCode
      );

      // create EraModel with imageUrl
      final model = EraModel(
        eraName: eraEntity.eraName,
        eraPeriod: eraEntity.eraPeriod,
        eraCode: eraEntity.eraCode,
        imageFile: eraEntity.imageFile,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
      );

      // convert entity to model then insert into Supa
      await dataSource.insertEra(model.toMap());

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
