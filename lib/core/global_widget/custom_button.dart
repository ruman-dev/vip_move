import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    this.textColor,
    this.btnBorderRadius,
    this.fontSize,
    this.fontWeight,
    this.backgroundColor,
  });

  final String btnText;
  final Color? textColor;
  final void Function() onPressed;
  final double? btnBorderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnBorderRadius ?? 8.w),
          ),
        ),
        onPressed: onPressed,
        child: CustomTextPoppins(
          text: btnText,
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
