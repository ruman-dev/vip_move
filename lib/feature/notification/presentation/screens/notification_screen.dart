import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Notifications'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPoppins(
              text: 'Today',
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(width: 1, color: Color(0xFFE3E3E9)),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 63.w,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0x4DB6EFFF),
                          ),
                          child: Image.asset(AssetPath.walletIcon),
                        ),
                        title: CustomTextPoppins(
                          text: 'Payment Successful!',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                        subtitle: CustomTextPoppins(
                          text: 'You have made a services payment',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
