import 'package:flutter/material.dart';
import 'package:timelens_dashboard/features/add_era/presentation/views/add_era_view.dart';
import 'package:timelens_dashboard/features/admin_action/presentation/views/admin_action_view.dart';
import 'package:timelens_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashboardView(),
        settings: settings,
      );

    case AdminActionView.routeName:
      return MaterialPageRoute(
        builder: (_) => const AdminActionView(),
        settings: settings,
      );


    case AddEraView.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddEraView(),
        settings: settings,
      );

    default:
      return null;
  }
}
