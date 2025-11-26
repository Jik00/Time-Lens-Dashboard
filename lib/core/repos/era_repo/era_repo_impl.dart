import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
      
      debugPrint("STEP 0: Starting era addition...");

      String imageUrl = await storageService.uploadFile(
        eraEntity.imageFile,
        eraEntity.eraCode, // folder name inside bucket
      );

      debugPrint("STEP 1: Upload done, imgUlr = $imageUrl");

      // 2. Prepare model for DB insertion
      final model = EraModel(
        eraName: eraEntity.eraName,
        eraPeriod: eraEntity.eraPeriod,
        eraCode: eraEntity.eraCode,
        imageFile: eraEntity.imageFile,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
      );

      debugPrint("STEP 2: Inserting era into database...");

      // 3. Insert into Supabase table
      await dataSource.insertEra(model.toMap());

      debugPrint("STEP 3: Era inserted successfully");

      return const Right(null);
    } catch (e) {
      debugPrint('Error adding era: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
