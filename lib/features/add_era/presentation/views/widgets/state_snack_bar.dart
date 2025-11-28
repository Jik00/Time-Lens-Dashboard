import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@override
SnackBar buildSnackBar({required String message, required Color color}) {
  return SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.symmetric(horizontal: 70.w, vertical: 300.h),
  );
}
