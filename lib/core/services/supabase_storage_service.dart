import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens_dashboard/constants.dart';
import 'package:timelens_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;

class SupabaseStorageService implements StorageService {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Future<String> uploadFile(File file, String filePath) async {
    try {

      debugPrint("Uploading file: ${file.path}");

      if (!await file.exists()) {
        throw Exception("File does not exist: ${file.path}");
      }

      final String fileName = p.basename(file.path);
      final fullPath = "$filePath/$fileName";

      debugPrint("Uploading to path: $fullPath");

      // Upload the file
      final uploadResult = await _client.storage.from(kSupaBucketForEras).upload(fullPath, file);
       // Check if upload was successful
      if (uploadResult.isEmpty) {
        throw Exception("Upload returned empty response");
      }

      final publicUrl =
          _client.storage.from(kSupaBucketForEras).getPublicUrl(fullPath);

      debugPrint("Upload successful. Public URL: $publicUrl");

      return publicUrl;
    } catch (e) {
      debugPrint("Storage upload error: $e");
      throw Exception("Failed to upload: $e");
    }
  }
}
