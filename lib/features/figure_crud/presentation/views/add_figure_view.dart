import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/views/widgets/add_figure_view_body.dart';

class AddFigureView extends StatelessWidget {
  const AddFigureView({super.key});


  static const String routeName = 'add_figure';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Historical Figure'),
      body: const AddFigureViewBody(),
    );
  }
}