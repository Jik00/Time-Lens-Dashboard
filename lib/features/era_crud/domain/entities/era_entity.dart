import 'dart:io';

class EraEntity {
  final String eraName;
  final String eraPeriod;
  final String eraCode;
  final File imageFile;

  EraEntity({
    required this.eraPeriod,
    required this.eraName,
    required this.eraCode,
    required this.imageFile,
  });
}
