import 'package:flutter/material.dart';
import 'package:timelens_dashboard/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: DashboardViewBody(),
    );
  }
}
