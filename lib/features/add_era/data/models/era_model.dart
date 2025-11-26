import 'dart:io';

class EraModel {
  final String eraName;
  final String eraPeriod;
  final String eraCode;
  final File imageFile;
  final String imageUrl;
  final DateTime? createdAt;

  EraModel({
    required this.eraName,
    required this.eraPeriod,
    required this.eraCode,
    required this.imageFile,
    required this.imageUrl,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'era_name': eraName,
      'era_period': eraPeriod,
      'era_code': eraCode,
      'image_url': imageUrl,
      'created_at': createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }
}