import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class CallingScreen extends StatelessWidget {
  const CallingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Jenny Wilson'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 130.r,
                backgroundColor: Color(0x1A00D2FF),
                child: CircleAvatar(
                  radius: 100.r,
                  backgroundImage: NetworkImage(
                    'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/6da1ac9f7bcb3ed051e6dc1942268520b46cbf43',
                  ),
                ),
              ),
            ),
            CustomTextPoppins(
              text: 'Jenny Wilson',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGrey,
            ),
            SizedBox(height: 20.h),
            CustomTextPoppins(
              text: '04:38 minutes',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrey,
            ),

            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF8A9B), Color(0xFFFF4D67)],
                      ),
                    ),
                    child: Image.asset(AssetPath.closeIcon, width: 30.w),
                  ),
                  Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF00D2FF),
                    ),
                    child: Image.asset(AssetPath.videoCallIcon, width: 30.w),
                  ),
                  Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFAB38), Color(0xFFFB9400)],
                      ),
                    ),
                    child: Image.asset(AssetPath.speakerIcon, width: 30.w),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
