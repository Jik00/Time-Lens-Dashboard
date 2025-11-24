import 'package:timelens_dashboard/core/repos/era_repo.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/add_era_entity.dart';

class EraRepoImpl implements EraRepo {

//   final EraRemoteDataSource remoteDataSource;
//   EraRepoImpl({required this.remoteDataSource});

@override
  Future<void> addEra(AddEraEntity era) async {
    // return await remoteDataSource.addEra(era);
  }
}