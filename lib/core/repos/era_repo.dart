import 'package:timelens_dashboard/features/add_era/domain/entities/add_era_entity.dart';

abstract class EraRepo {
  Future<void> addEra(AddEraEntity era);
}