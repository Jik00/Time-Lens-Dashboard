import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/services/get_it_service.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';
import 'package:timelens_dashboard/features/era_crud/domain/usecases/get_eras_usecase.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/cubit/get_eras_cubit/get_eras_list_cubit.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/get_eras_view_bloc_builder.dart';

class GetEraView extends StatelessWidget {
  const GetEraView({super.key});

  static const String routeName = 'view_era';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('All Eras'),
      body: BlocProvider(
        create: (context) =>
            GetErasListCubit(getErasUsecase: getIt<GetErasUsecase>()),
        child: const GetErasViewBlocBuilder(),
      ),
    );
  }
}
