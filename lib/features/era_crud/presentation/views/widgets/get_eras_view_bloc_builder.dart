import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/cubit/get_eras_cubit/get_eras_list_cubit.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/eras_list.dart';

class GetErasViewBlocBuilder extends StatelessWidget {
  const GetErasViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetErasListCubit, GetErasListState>(
      builder: (context, state) {
        if (state is GetErasListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetErasListSuccess) {
          return ErasList( eras: state.eras );
        } else if (state is GetErasListFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
        
      },
    );
  }
}