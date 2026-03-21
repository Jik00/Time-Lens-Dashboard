import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectErasLoadingFailure extends StatelessWidget {
  const SelectErasLoadingFailure({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Select the belonged era',
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconColor: Colors.white,
      collapsedIconColor: const Color(0xFFBC8729),
      backgroundColor: const Color(0xFF614317),
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          side: BorderSide(color: const Color(0xFFBC8729))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white)),
          ),
          child: Center(child: child),
        ),
      ],
    );
  }
}
