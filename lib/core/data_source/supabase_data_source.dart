import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/core/data_source/data_source.dart';

class SupabaseDataSource implements DataSource {
  final SupabaseClient supabase;

  SupabaseDataSource(this.supabase);
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

    @override
      Future<List<Map<String, dynamic>>> fetchAllData(
      {required String tableName}) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .order('created_at', ascending: true);

      log("Fetched ${response.length} objects");
      return response;
    } catch (e) {
      log("Error fetching data: $e");
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchDataBy(
      {required String tableName,
      required String query,
      required String value}) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .eq(query, value)
          .order('created_at', ascending: true);

      log("Fetched ${response.length} objects");
      return response;
    } catch (e) {
      log("Error fetching data: $e");
      rethrow;
    }
  }
}
