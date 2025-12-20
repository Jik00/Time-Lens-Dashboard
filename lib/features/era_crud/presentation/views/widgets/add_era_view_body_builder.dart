import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/cubit/add_era_cubit.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/add_era_view_body.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/state_snack_bar.dart';

class AddEraViewBodyBuilder extends StatelessWidget {
  const AddEraViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EraCubit, EraCubitState>(
      listener: (BuildContext context, EraCubitState state) {
        if (state is EraCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(
              message: state.message,
              color: Colors.red,
            ),
          );
        } else if (state is EraCubitSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(
              message: 'Era added successfully!',
              color: Colors.green,
            ),
          );
          // call reset form
          Future.delayed(const Duration(milliseconds: 1500), () {
            context.read<EraCubit>().resetForm();
          });
        }
      },
      builder: (BuildContext context, EraCubitState state) {
        return ModalProgressHUD(
            inAsyncCall: state is EraCubitLoading,
            child: AddEraViewBody(state: state));
      },
    );
  }
}
