import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';
import 'package:timelens_dashboard/features/add_era/presentation/views/widgets/add_era_view_body.dart';

class AddEraView extends StatelessWidget {
  const AddEraView({super.key});

  static const String routeName = 'add_era';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Era'),
      body: const AddEraViewBody(),
    );
  }
}
