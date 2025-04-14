import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textfield.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<String> chatList = [
    'Good, thanks Jenny...',
    'Yes, I have received your order. I will come on that date! 😁😁',
    'Hi, morning too Andrew!',
    'I have booked your house cleaning service for December 23 at 10 AM 😁',
    'Hi Jenny, good morning 😄',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Jenny Wilson',
        appbarActions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: GestureDetector(
              onTap: () {
                //After Call Button Clicked ------------------------
                Get.toNamed(Routes.callingScreen);
              },
              child: Image.asset(AssetPath.callIcon, width: 28.w),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                bool isMe = index % 2 == 0;
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 7.h,
                      bottom: 5.h,
                      left: isMe ? 65.w : 10.w,
                      right: isMe ? 10.w : 65.w,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? AppColors.primary : Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        topLeft:
                            isMe ? Radius.circular(12.r) : Radius.circular(0.r),
                        bottomRight: Radius.circular(12.r),
                        topRight:
                            isMe ? Radius.circular(0.r) : Radius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextPoppins(
                          text: chatList[index],
                          color: isMe ? Colors.white : Color(0xFF212121),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 5.h),
                        CustomTextPoppins(
                          text: '10:00 PM',
                          color: isMe ? Colors.white : Color(0xFF212121),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                SizedBox(width: 5.h),
                Expanded(
                  child: CustomTextfield(
                    hintText: 'Message...',
                    suffixImage: AssetPath.galleryIcon,
                    onSuffixTap: () {
                      // After gallery icon clicked ------------------------
                    },
                  ),
                ),
                SizedBox(width: 15.h),
                GestureDetector(
                  onTap: () {
                    // After send button clicked ---------------------------
                  },
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AssetPath.sendIcon),
                  ),
                ),
                SizedBox(width: 5.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
