import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:wx_divider/wx_divider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.color,
    this.height,
    this.width,
    this.onFilterTap,
  });

  final Color? color;
  final double? height;
  final double? width;
  final void Function()? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width * 0.5,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: color ?? Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                AssetPath.searchIcon,
                width: 20.w,
                color: AppColors.lightGrey,
              ),
              SizedBox(width: 10.h),
              CustomTextPoppins(
                text: 'Search',
                color: AppColors.lightGrey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Row(
            children: [
              WxDivider(
                direction: Axis.vertical,
                thickness: 2,
                color: Color(0xFFE9EBED),
              ),
              SizedBox(width: 5.w),
              GestureDetector(
                onTap: onFilterTap,
                child: Image.asset(
                  AssetPath.filterIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
