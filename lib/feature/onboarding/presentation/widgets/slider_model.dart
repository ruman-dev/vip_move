import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';

class SliderModel extends StatelessWidget {
  const SliderModel({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(image), width: screenWidth, fit: BoxFit.fill),
        SizedBox(height: 40.h),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CustomTextPoppins(
              text: title,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGrey,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CustomTextPoppins(
              text: description,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
