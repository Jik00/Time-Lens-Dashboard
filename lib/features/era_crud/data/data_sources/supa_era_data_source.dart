import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/constants.dart';

class SupabaseEraDataSource {
  final SupabaseClient supabase;

  SupabaseEraDataSource(this.supabase);

  Future<void> insertEra(Map<String, dynamic> data) async {
    try {
      log (data.toString());
      await supabase.from(kSupaErasTable).insert(data);

    } catch (e) {
      rethrow;
    }
  }
}
