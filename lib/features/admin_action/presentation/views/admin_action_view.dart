import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/enums/navigate_enums.dart';
import 'package:timelens_dashboard/core/widgets/custom_appbar.dart';

import 'widgets/admin_action_view_body.dart';

class AdminActionView extends StatelessWidget {
  const AdminActionView({super.key, required this.targetCategory});

  static const routeName = 'adminAction';

  final TargetCategory targetCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Manage ${targetCategory.name}s'),
      backgroundColor: const Color(0xFF1E1E1E),
      body: AdminActionViewBody( targetCategory: targetCategory),
    );
  }
}
