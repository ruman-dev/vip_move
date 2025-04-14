import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class CustomService extends StatelessWidget {
  const CustomService({super.key, this.isBottomButtonActive, this.imagePath, this.title, this.rating, this.price});

  final Widget? isBottomButtonActive;
  final String? imagePath;
  final String? title;
  final num? rating;
  final num? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120.w,
                height: 78.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imagePath ??
                          'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/a1b79c4423d6ed4ad68af2cf8ac46eb45a4be68a',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPoppins(text: title ?? 'No Name', fontSize: 20.sp, fontWeight: FontWeight.w500),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPath.starIcon, width: 16.w),
                      SizedBox(width: 5.w),
                      CustomTextPoppins(
                        text: rating.toString(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightGrey,
                      ),
                      CustomTextPoppins(text: ' | ', fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0x807F7F8A)),
                      CustomTextPoppins(
                        text: '6,182 reviews',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightGrey,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomTextPoppins(text: '\$${price ?? 0.0}', fontSize: 18.sp, color: AppColors.primary),
                ],
              ),
            ],
          ),
          isBottomButtonActive ?? SizedBox(),
          SizedBox(height: 10.h),
          Divider(thickness: 1, color: Color(0xFFEEEEEE)),
        ],
      ),
    );
  }
}
