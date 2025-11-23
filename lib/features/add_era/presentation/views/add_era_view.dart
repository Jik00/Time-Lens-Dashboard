import 'package:flutter/material.dart';
import 'package:timelens_dashboard/features/add_era/presentation/views/widgets/add_era_view_body.dart';

class AddEraView extends StatelessWidget {
  const AddEraView({super.key});

  static const String routeName = 'add_era';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: AddEraViewBody()
        ),
      ),
    );
  }
}