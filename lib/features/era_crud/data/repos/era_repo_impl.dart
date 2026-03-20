import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/core/errors/failures.dart';
import 'package:timelens_dashboard/features/era_crud/data/models/era_model.dart';
import 'package:timelens_dashboard/features/era_crud/domain/repos/era_repo.dart';
import 'package:timelens_dashboard/core/services/storage_service.dart';
import 'package:timelens_dashboard/core/data_source/supabase_data_source.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';

import '../../../../constants.dart';

class EraRepoImpl implements EraRepo {
  final StorageService storageService;
  final SupabaseDataSource supaDatabaseService;

  EraRepoImpl({
    required this.supaDatabaseService,
    required this.storageService,
  });

  @override
  Future<Either<Failure, void>> addEra({ required EraEntity era, required File imgFile}) async {
    try {
      String imageUrl = await storageService.uploadFile(
        file: imgFile,
        filePath: era.eraCode,
        bucketName: kSupaBucketForEras,
        // saved inside bucket by eraCode
      );

      // create EraModel with imageUrl
      final model = EraModel(
        eraName: era.eraName,
        eraPeriod: era.eraPeriod,
        eraCode: era.eraCode,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
      );

      // convert entity to model then insert into Supa

      await supaDatabaseService.addData(
          tableName: kSupaErasTable, data: model.toMap());

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

  @override
  Future<Either<Failure, List<EraEntity>>> getAllEras() async {
    try {
      final response =
          await supaDatabaseService.fetchAllData(tableName: kSupaErasTable);
      debugPrint("Successfully fetched ${response.length} eras");

      final eras = response.map((json) => EraEntity.fromMap(json)).toList();

      return Right(eras);
    } on PostgrestException catch (e) {
      return Left(DatabaseFailure('Database error: ${e.message}'));
    } on SocketException catch (e) {
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
