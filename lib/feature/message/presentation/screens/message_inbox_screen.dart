import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class MessageInboxScreen extends StatelessWidget {
  const MessageInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Inbox',
        appbarActions: [
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: Image.asset(AssetPath.searchIcon, width: 24.w),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.chatScreen);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/38a5248babd099c943f3d86ab038fd8d73c0e97e',
                      ),
                    ),
                    title: CustomTextPoppins(
                      text: 'Jenny Wilson',
                      fontSize: 16.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2D2D2D),
                    ),
                    subtitle: CustomTextPoppins(
                      text: 'I have booked your house in Dhaka',
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    trailing: Column(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.primary,
                          child: CustomTextPoppins(
                            text: '2',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextPoppins(
                          text: '10:48',
                          color: Color(0xFFB4B4B4),
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
        ],
      ),
    );
  }
}
