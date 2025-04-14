import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';

class CustomLocalService extends StatelessWidget {
  const CustomLocalService({super.key, required this.title, required this.imgPath});
  final String title;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 268.w,
            height: 172.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: NetworkImage(imgPath), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextPoppins(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
