import 'dart:io';

class FigureEntity {
  final String figureName;
  final String dynasty;
  final String reignPeriod;
  final String figureCode;
  final String belongEra;
  final File imageFile;

  FigureEntity({
    required this.figureName,
    required this.dynasty,
    required this.reignPeriod,
    required this.figureCode,
    required this.belongEra,
    required this.imageFile,
  });
}
