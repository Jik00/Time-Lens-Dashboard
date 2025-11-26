import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/constants.dart';
import 'package:timelens_dashboard/core/helper_functions/ongenerate_routes.dart';
import 'package:timelens_dashboard/core/services/custom_bloc_observer.dart';
import 'package:timelens_dashboard/core/services/get_it_service.dart';
import 'package:timelens_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: kSupaURL,
    anonKey: kSupaKey,
  );
  setupGetIt();
  Bloc.observer = CustomBlocObserver();
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
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF1E1E1E),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFBC8729),
            ),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoutes,
          initialRoute: DashboardView.routeName,
        );
      },
    );
  }
}
