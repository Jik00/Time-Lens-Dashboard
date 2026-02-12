import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/cubit/add_figure_cubit/add_figure_cubit.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/views/widgets/add_figure_view_body_builder.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/usecases/add_figure_usecase.dart';

class AddFigureView extends StatelessWidget {
  const AddFigureView({super.key});

  static const String routeName = 'add_figure';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Historical Figure'),
      body: BlocProvider(
        create: (context) => AddFigureCubit(getIt<AddFigureUsecase>()),
        child: const AddFigureViewBodyBuilder(),
      ),
    );
  }
}