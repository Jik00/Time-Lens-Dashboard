class EraEntity {
  final String eraName;
  final String eraPeriod;
  final String eraCode;
  final String? imgUrl;

  EraEntity({
    required this.eraPeriod,
    required this.eraName,
    required this.eraCode,
    this.imgUrl,
  });

  factory EraEntity.fromMap(Map<String, dynamic> map) => EraEntity(
        eraName: map['era_name'],
        eraPeriod: map['era_period'],
        eraCode: map['era_code'],
        imgUrl: map['image_url'],
      );
}
