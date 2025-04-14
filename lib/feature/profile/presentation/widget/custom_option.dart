import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vid_move/core/utils/app_colors.dart';

class Options extends StatelessWidget {
  const Options({
    super.key,
    required this.imagePath,
    required this.option,
    required this.onPressed,
    required this.isSelected,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
  });

  final String imagePath;
  final String option;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? Color(0xFF00D2FF) : Color(0xFFE2E8F0),
          ),
          color: isSelected ? Color(0xFFEEF7FD) : Color(0xFFFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFFFFFFF) : Color(0x33E2E8F0),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(imagePath, width: 20.w),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  option,
                  style: GoogleFonts.poppins(
                    fontSize: fontSize ?? 18.sp,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    color: fontColor ?? Color(0xFF20222C),
                  ),
                ),
              ),

              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_off,
                color: isSelected ? AppColors.primary : Color(0xFFE2E8F0),
                size: 25.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
