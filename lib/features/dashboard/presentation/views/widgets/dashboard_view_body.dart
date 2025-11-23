import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/widgets/custom_button.dart';
import 'package:timelens_dashboard/features/add_era/presentation/views/add_era_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            hint: 'Add Era',
            w: 330,
            onTap: () {
              Navigator.pushNamed(context, AddEraView.routeName);
            },
            fillColor: const Color(0xFF614317),
            borderColor: const Color(0xFFBC8729),
          ),
        ],
      ),
    );
  }
}
