import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';

import '../constants/constants.dart';
import 'app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.btnWidth,
    this.btnHeight,
    this.btnColor,
    this.btnRadius,
    required this.text,
  });

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final double? btnRadius;
  final Color? btnColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? 78.w,
        height: btnHeight ?? 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(btnRadius ?? 12.r),
          color: btnColor ?? kPrimary, // BoxDecoration
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(12, LightWhite, FontWeight.w500),
          ),
        ),
      ), // Container
    ); // GestureDetector
  }
}
