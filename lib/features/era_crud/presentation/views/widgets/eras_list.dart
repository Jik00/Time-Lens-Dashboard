import 'package:flutter/material.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/expansion_tile_item.dart';

class ErasList extends StatelessWidget {
  const ErasList({super.key, required this.eras});

  final List<EraEntity> eras;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(6),
      itemCount: eras.length,
      itemBuilder: (context, index) => ExpansionTileItem(era: eras[index]),
    );
  }
}
