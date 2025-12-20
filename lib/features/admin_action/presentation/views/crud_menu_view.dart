import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/enums/navigate_enums.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';

import 'widgets/crud_menu_view_body.dart';

class CrudMenuView extends StatelessWidget {
  const CrudMenuView({super.key, required this.targetCategory});

  static const routeName = 'adminAction';

  final TargetCategory targetCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Manage ${targetCategory.name}s'),
      backgroundColor: const Color(0xFF1E1E1E),
      body: CrudMenuViewBody(targetCategory: targetCategory),
    );
  }
}
