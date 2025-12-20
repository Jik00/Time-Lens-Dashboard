import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens_dashboard/core/widgets/custom_button.dart';
import '../../../../../core/enums/navigate_enums.dart';
import '../../../../admin_action/presentation/views/crud_menu_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'What are we handling today ?',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 32.h,
          ),
          CustomButton(
            hint: 'Eras',
            w: 330,
            onTap: () {
              Navigator.pushNamed(
                context,
                CrudMenuView.routeName,
                arguments: TargetCategory.era,
              );
            },
            fillColor: const Color(0xFF614317),
            borderColor: const Color(0xFFBC8729),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            hint: 'Figures',
            w: 330,
            onTap: () {
              Navigator.pushNamed(
                context,
                CrudMenuView.routeName,
                arguments: TargetCategory.figure,
              );
            },
            fillColor: const Color(0xFF614317),
            borderColor: const Color(0xFFBC8729),
          ),
        ],
      ),
    );
  }
}
