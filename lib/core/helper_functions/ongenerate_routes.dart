import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/enums/navigate_enums.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/add_era_view.dart';
import 'package:timelens_dashboard/features/admin_action/presentation/views/crud_menu_view.dart';
import 'package:timelens_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/view_era_view.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashboardView(),
        settings: settings,
      );

    case CrudMenuView.routeName:
      final TargetCategory targetCategory =
          settings.arguments as TargetCategory;
      return MaterialPageRoute(
        builder: (_) => CrudMenuView(
          targetCategory: targetCategory,
        ),
        settings: settings,
      );

    case AddEraView.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddEraView(),
        settings: settings,
      );

    case ViewEraView.routeName:
      return MaterialPageRoute(
        builder: (_) => const ViewEraView(),
        settings: settings,
      );

    default:
      return null;
  }
}
