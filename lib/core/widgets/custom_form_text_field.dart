import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormTextfield extends StatelessWidget {
  const CustomFormTextfield(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.onSaved,
      this.maxLines});


  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      child: TextFormField(
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
          maxLines: maxLines?? 1,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.white),
            floatingLabelStyle: const TextStyle(),
            errorStyle: const TextStyle(color: Colors.red),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: Colors.transparent,
            enabled: true,
            enabledBorder: buildBorder(),
            border: buildBorder(),
          )),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFBC8729),
      ),
    );
  }
}
