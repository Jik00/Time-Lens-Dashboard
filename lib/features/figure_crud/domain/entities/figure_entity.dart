import 'dart:io';

class FigureEntity {
  final String figureName;
  final String dynasty;
  final String reignPeriod;
  final String figureCode;
  final File imageFile;

  FigureEntity({
    required this.figureName,
    required this.dynasty,
    required this.reignPeriod,
    required this.figureCode,
    required this.imageFile,
  });
}
