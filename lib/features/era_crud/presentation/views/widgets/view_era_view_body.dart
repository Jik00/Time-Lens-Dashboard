import 'package:flutter/material.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/expansion_tile_item.dart';

class ViewEraViewBody extends StatelessWidget {
  const ViewEraViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(6),
        itemBuilder: (index, context) => const ExpansionTileItem(),
        itemCount: 10);
  }
}
