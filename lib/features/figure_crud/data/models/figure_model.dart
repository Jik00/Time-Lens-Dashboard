import 'dart:io';

class FigureModel {
  final String figureName;
  final String reignPeriod;
  final String dynasty;
  final String belongEra;
  final String figureCode;
  final File imageFile;
  final String imageUrl;
  final DateTime? createdAt;

  FigureModel({
    required this.figureName,
    required this.reignPeriod,
    required this.dynasty,
    required this.belongEra,
    required this.figureCode,
    required this.imageFile,
    required this.imageUrl,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'figure_name': figureName,
      'reign_period': reignPeriod,
      'dynasty': dynasty,
      'belong_era': belongEra,
      'figure_code': figureCode,
      'image_url': imageUrl,
      'created_at':
          createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }
}
