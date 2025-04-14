import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';

class CustomServiceView extends StatelessWidget {
  const CustomServiceView({super.key, required this.imgPath, required this.title, required this.isFullScreen});

  final String imgPath;
  final String title;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imgPath), fit: BoxFit.cover)),
        ),
        // Image.network(imgPath, width: isFullScreen ? MediaQuery.sizeOf(context).width * 0.15 : MediaQuery.sizeOf(context).width * 0.1),
        SizedBox(height: isFullScreen ? 12.h : 8.h),
        CustomTextPoppins(
          text: title,
          fontSize: isFullScreen ? 14.sp : 12.sp,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
