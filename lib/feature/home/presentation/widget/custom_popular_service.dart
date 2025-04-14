import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class CustomPopularService extends StatelessWidget {
  const CustomPopularService({super.key, this.title, required this.imgPath, this.rating, this.averageRating});
  final String imgPath;
  final String? title;
  final String? rating;
  final String? averageRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 204.w,
            height: 126.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: NetworkImage(imgPath), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5.h),
          CustomTextPoppins(text: title ?? '', fontSize: 16.sp, fontWeight: FontWeight.w500),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AssetPath.starIcon, width: 16.w),
              SizedBox(width: 5.w),
              CustomTextPoppins(text: rating ?? '0', fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.lightGrey),

              CustomTextPoppins(text: ' | ', fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0x807F7F8A)),
              CustomTextPoppins(
                text: '${averageRating.toString()} reviews',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
