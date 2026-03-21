import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/cubit/get_eras_cubit/get_eras_list_cubit.dart';

class RetryRow extends StatelessWidget {
  const RetryRow( {super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message ??
                  'Something went wrong! ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.read<GetErasListCubit>().getErasList(),
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            );
  }
}