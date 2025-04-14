import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textbox.dart';
import 'package:vid_move/core/routes/routes.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Give Your feedback'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextPoppins(text: 'How was your experience with Fix it?', fontSize: 16.sp, fontWeight: FontWeight.w500),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              glowColor: Color(0xFFFC990C),
              unratedColor: Color(0xFFE1B982).withValues(alpha: 0.4),

              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(height: 20.h),
            CustomTextPoppins(text: 'Write in below box', fontSize: 14.sp, fontWeight: FontWeight.w500),
            SizedBox(height: 20.h),
            CustomTextbox(hint: 'Write here...'),
            SizedBox(height: 20.h),
            CustomButton(
              btnText: 'Submit',
              onPressed: () {
                Get.offAllNamed(Routes.bottomNavBar);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
