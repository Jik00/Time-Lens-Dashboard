import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/constants.dart';

class SupabaseEraDataSource {
  final SupabaseClient supabase;

  SupabaseEraDataSource(this.supabase);

  Future<void> insertEra(Map<String, dynamic> data) async {
    try {
      debugPrint("Inserting data into table: $kSupaErasTable");
      debugPrint("Data: $data");

      final response = await supabase
          .from(kSupaErasTable)
          .insert(data)
          .select(); // Add .select() to get response

      debugPrint("Insert response: $response");
    } catch (e) {
      debugPrint("Database insert error: $e");
      rethrow;
    }
  }
}
