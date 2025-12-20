import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/services/get_it_service.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/cubit/add_era_cubit.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/view_era_view_body.dart';

class ViewEraView extends StatelessWidget {
  const ViewEraView({super.key});

  static const String routeName = 'view_era';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('All Eras'),
      body: BlocProvider(
        create: (context) => getIt<EraCubit>(),
        child: const ViewEraViewBody(),
      ),
    );
  }
}
