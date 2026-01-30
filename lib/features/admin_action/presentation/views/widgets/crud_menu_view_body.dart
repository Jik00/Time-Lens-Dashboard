import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens_dashboard/core/enums/navigate_enums.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/add_era_view.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/view_era_view.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/views/add_figure_view.dart';

import '../../../../../core/widgets/custom_button.dart';

class CrudMenuViewBody extends StatelessWidget {
  const CrudMenuViewBody({super.key, required this.targetCategory});

  final TargetCategory targetCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Pick Your Action',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 32.h,
          ),
          CustomButton(
            hint: 'Add',
            w: 330,
            onTap: () {
              if (targetCategory == TargetCategory.era) {
                Navigator.pushNamed(context, AddEraView.routeName);
              }else{
                Navigator.pushNamed(context, AddFigureView.routeName);
              }
            },
            fillColor: const Color(0xFF614317),
            borderColor: const Color(0xFFBC8729),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            hint: 'Update',
            w: 330,
            onTap: () {
              // Navigator.pushNamed(context, AddEraView.routeName);
            },
            fillColor: const Color(0xFF614317),
            borderColor: const Color(0xFFBC8729),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            hint: 'Delete',
            w: 330,
            onTap: () {
              // Navigator.pushNamed(context, AddEraView.routeName);
            },
            fillColor: const Color(0xFF614317),
            borderColor: const Color(0xFFBC8729),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            hint: 'View',
            w: 330,
            onTap: () {
              Navigator.pushNamed(context, ViewEraView.routeName);
            },
            fillColor: const Color(0xFF614317),
            borderColor: const Color(0xFFBC8729),
          ),
        ],
      ),
    );
  }
}
