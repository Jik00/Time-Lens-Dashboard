import 'package:flutter/material.dart';
import 'package:timelens_dashboard/features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
        settings: settings,
      );
    
    default:
      return null;
  }
}
