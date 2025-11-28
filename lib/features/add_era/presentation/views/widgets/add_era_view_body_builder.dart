import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens_dashboard/features/add_era/presentation/cubit/add_era_cubit.dart';
import 'package:timelens_dashboard/features/add_era/presentation/views/widgets/add_era_view_body.dart';
import 'package:timelens_dashboard/features/add_era/presentation/views/widgets/state_snack_bar.dart';

class AddEraViewBodyBuilder extends StatelessWidget {
  const AddEraViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEraCubit, AddEraCubitState>(
      listener: (BuildContext context, AddEraCubitState state) {
        if (state is AddEraCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(
              message: state.message,
              color: Colors.red,
            ),
          );
        } else if (state is AddEraCubitSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(
              message: 'Era added successfully!',
              color: Colors.green,
            ),
          );
          // call reset form 
          Future.delayed(const Duration(milliseconds: 1500), () {
            context.read<AddEraCubit>().resetForm();
          });

        }
      },
      builder: (BuildContext context, AddEraCubitState state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddEraCubitLoading,
            child: AddEraViewBody(state: state));
      },
    );
  }
}
