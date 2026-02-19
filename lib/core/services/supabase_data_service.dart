import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/core/services/data_service.dart';

class SupabaseDataService implements DataService {
  final SupabaseClient supabase;

  SupabaseDataService(this.supabase);
  @override
  Future<void> addData(
      {required String tableName, required Map<String, dynamic> data}) async {
    try {
      log(data.toString());

      await supabase.from(tableName).insert(data);
    } catch (e) {
      rethrow;
    }
  }
}
