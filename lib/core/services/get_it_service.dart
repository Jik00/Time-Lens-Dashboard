import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/core/repos/era_repo/era_repo.dart';
import 'package:timelens_dashboard/core/repos/era_repo/era_repo_impl.dart';
import 'package:timelens_dashboard/core/services/supabase_data_service.dart';
import 'package:timelens_dashboard/core/services/supabase_storage_service.dart';
import 'package:timelens_dashboard/features/era_crud/domain/usecases/add_era_usecase.dart';

import '../../features/figure_crud/domain/usecases/add_figure_usecase.dart';
import '../repos/figure_repo/figure_repo.dart';
import '../repos/figure_repo/figure_repo_impl.dart';

final getIt = GetIt.instance;
final supabase = Supabase.instance.client;

void setupGetIt() {
  getIt.registerSingleton(SupabaseStorageService());

  getIt.registerSingleton(SupabaseDataService(supabase));

  getIt.registerSingleton<EraRepo>(EraRepoImpl(
    supaDatabaseService: getIt<SupabaseDataService>(),
    storageService: getIt<SupabaseStorageService>(),
  ));
  getIt.registerSingleton<FigureRepo>(FigureRepoImpl(
    supaDatabaseService: getIt<SupabaseDataService>(),
    storageService: getIt<SupabaseStorageService>(),
  ));

  getIt.registerSingleton(AddEraUsecase(eraRepo: getIt<EraRepo>()));
  getIt.registerSingleton(AddFigureUsecase(figureRepo: getIt<FigureRepo>()));
}
