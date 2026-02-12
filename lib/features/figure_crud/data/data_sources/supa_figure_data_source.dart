import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/constants.dart';

class SupabaseFigureDataSource {
  final SupabaseClient supabase;

  SupabaseFigureDataSource(this.supabase);

  Future<void> insertFigure(Map<String, dynamic> data) async {
    try {
      log (data.toString());
      await supabase.from(kSupaFiguresTable).insert(data);

    } catch (e) {
      rethrow;
    }
  }
}
