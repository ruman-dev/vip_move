import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: AppColors.primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10.h, width: 10.w),
            Column(
              children: [
                Image.asset(
                  AssetPath.splashBack,
                  height: 204.h,
                  width: 204.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 30),
                CustomTextPoppins(
                  text: 'Services 24/7 Inc',
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              height: 60.h,
              width: 60.w,
              child: SpinKitCircle(
                duration: Duration(seconds: 3),
                size: 60,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
