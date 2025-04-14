import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.buttonform,
    this.title,
    this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.assetPath,
  });

  final Widget? buttonform;
  final String? title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.sp),
        color: Color(0xFFFEFEFE),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            assetPath ?? AssetPath.dialogBack,
            height: 81.h,
            width: 81.w,
          ),
          SizedBox(height: 20.h),
          CustomTextPoppins(
            text: title ?? 'Success',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            color: titleColor ?? AppColors.darkGrey,
          ),
          SizedBox(height: 10.h),
          CustomTextPoppins(
            text: subtitle ?? '',
            fontSize: 16.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            color: subtitleColor ?? AppColors.lightGrey,
          ),
          SizedBox(height: 25.h),
          buttonform ??
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: CustomButton(
                  btnText: "Done",
                  onPressed: () => Get.offAllNamed(Routes.signInScreen),
                ),
              ),
        ],
      ),
    );
  }
}
