import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/features/era_crud/domain/repos/era_repo.dart';
import 'package:timelens_dashboard/features/era_crud/data/repos/era_repo_impl.dart';
import 'package:timelens_dashboard/core/data_source/supabase_data_source.dart';
import 'package:timelens_dashboard/core/services/supabase_storage_service.dart';
import 'package:timelens_dashboard/features/era_crud/domain/usecases/add_era_usecase.dart';
import 'package:timelens_dashboard/features/era_crud/domain/usecases/get_eras_usecase.dart';

import '../../features/figure_crud/domain/usecases/add_figure_usecase.dart';
import '../../features/figure_crud/domain/repos/figure_repo.dart';
import '../../features/figure_crud/data/repos/figure_repo_impl.dart';

final getIt = GetIt.instance;
final supabase = Supabase.instance.client;

void setupGetIt() {
  getIt.registerSingleton(SupabaseStorageService());

  getIt.registerSingleton(SupabaseDataSource(supabase));

  getIt.registerSingleton<EraRepo>(EraRepoImpl(
    supaDatabaseService: getIt<SupabaseDataSource>(),
    storageService: getIt<SupabaseStorageService>(),
  ));
  getIt.registerSingleton<FigureRepo>(FigureRepoImpl(
    supaDatabaseService: getIt<SupabaseDataSource>(),
    storageService: getIt<SupabaseStorageService>(),
  ));

  getIt.registerSingleton(AddEraUsecase(eraRepo: getIt<EraRepo>()));
  getIt.registerSingleton(GetErasUsecase(eraRepo: getIt<EraRepo>()));

  getIt.registerSingleton(AddFigureUsecase(figureRepo: getIt<FigureRepo>()));
}
