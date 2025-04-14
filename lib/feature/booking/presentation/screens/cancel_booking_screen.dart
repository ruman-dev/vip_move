import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_dialog.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textbox.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class CancelBookingScreen extends StatelessWidget {
  CancelBookingScreen({super.key});

  var selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Cancel Booking'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextPoppins(
                text: 'Please select the reason for cancellation:',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF212121),
              ),
            ),
            Divider(
              color: Color(0xFFEEEEEE),
              thickness: 1.w,
              indent: 16,
              endIndent: 16,
            ),
            Expanded(
              child: ListView(
                children: [
                  radioButton(1, 'Waiting for long time'),
                  radioButton(2, 'Unable to contact driver'),
                  radioButton(3, 'Driver denied to go to destination'),
                  radioButton(4, 'Driver denied to come to pickup'),
                  radioButton(5, 'Wrong address shown'),
                  radioButton(6, 'The price is not reasonable'),
                  radioButton(7, 'I want to order another restaurant'),
                  radioButton(8, 'I just want to cancel'),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextPoppins(
                      text: 'Others',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextbox(hint: 'Others reason...'),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                      btnText: 'Send',
                      onPressed: () {
                        if (selectedIndex.value > 0) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.all(0.0),
                                content: CustomDialog(
                                  title: 'We’re so sad about your cancellation',
                                  subtitle:
                                      'We will continue to improve our service & satisfy you on the next order.',
                                  titleColor: AppColors.darkGrey,
                                  subtitleColor: AppColors.secondaryLightGrey,
                                  assetPath: AssetPath.angryIcon,
                                  buttonform: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: CustomButton(
                                      btnText: 'OK',
                                      onPressed: () {
                                        Get.offAllNamed(Routes.bottomNavBar);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget radioButton(int index, [String? title]) {
    return Obx(
      () => RadioListTile(
        title: CustomTextPoppins(
          text: title ?? 'Null',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        activeColor: AppColors.primary,
        value: index,
        groupValue: selectedIndex.value,
        onChanged: (value) {
          selectedIndex.value = value!;
          print(selectedIndex);
        },
      ),
    );
  }
}
