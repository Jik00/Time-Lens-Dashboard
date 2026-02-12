import 'dart:io';

class FigureEntity {
  final String figureName;
  final String reignYears;
  final String reignPeriod;
  final String figureCode;
  final File imageFile;
  
  FigureEntity({
    required this.figureName,
    required this.reignYears,
    required this.reignPeriod,
    required this.figureCode,
    required this.imageFile,
  });
}
