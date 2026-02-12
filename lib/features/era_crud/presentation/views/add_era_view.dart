import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/services/get_it_service.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/cubit/add_era_cubit/add_era_cubit.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/add_era_view_body_builder.dart';

import '../../domain/usecases/add_era_usecase.dart';

class AddEraView extends StatelessWidget {
  const AddEraView({super.key});

  static const String routeName = 'add_era';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Era'),
      body: BlocProvider(
        create: (context) => EraCubit(getIt<AddEraUsecase>()),
        child: const AddEraViewBodyBuilder(),
      ),
    );
  }
}
