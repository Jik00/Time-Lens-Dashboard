import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/cubit/add_figure_cubit/add_figure_cubit.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/views/widgets/add_figure_view_body.dart';

import '../../../../era_crud/presentation/views/widgets/state_snack_bar.dart';

class AddFigureViewBodyBuilder extends StatelessWidget {
  const AddFigureViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFigureCubit, AddFigureState>(
      listener: (BuildContext context, AddFigureState state) {
        if (state is AddFigureFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(
              message: state.message,
              color: Colors.red,
            ),
          );
        } else if (state is AddFigureSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(
              message: 'Figure added successfully!',
              color: Colors.green,
            ),
          );
          // call reset form
          Future.delayed(const Duration(milliseconds: 1500), () {
            context.read<AddFigureCubit>().resetForm();
          });
        }
      },
      builder: (BuildContext context, AddFigureState state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddFigureLoading,
          child: AddFigureViewBody(state: state),
        );
      },
    );
  }
}
