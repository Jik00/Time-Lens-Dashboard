import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/helper_functions/ongenerate_routes.dart';
import 'package:timelens_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1E1E1E)),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoutes,
          initialRoute: DashboardView.routeName,
        );
      },
    );
  }
}
