import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/cubit/get_eras_cubit/get_eras_list_cubit.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/views/widgets/eras_expansion_tile.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/views/widgets/select_eras_loading_failure.dart';

class SelectErasBlocBuilder extends StatelessWidget {
  const SelectErasBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetErasListCubit, GetErasListState>(
      builder: (context, state) {
        if (state is GetErasListLoading) {
          return SelectErasLoadingFailure(child: CircularProgressIndicator());
        } else if (state is GetErasListSuccess) {
          return ErasExpansionTile(eras: state.eras);
        } else if (state is GetErasListFailure) {
          return SelectErasLoadingFailure(child: Text(state.message));
        } else {
          return SelectErasLoadingFailure(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
