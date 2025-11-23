import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.hint,
      this.onTap,
      required this.w,
      this.fillColor,
      this.borderColor});

  final String hint;
  final VoidCallback? onTap;
  final int w;
  final Color? fillColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: fillColor ?? Colors.transparent,
        minimumSize: Size(w.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: borderColor ?? Colors.white),
        ),
      ),
      child: Text(
        hint,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
