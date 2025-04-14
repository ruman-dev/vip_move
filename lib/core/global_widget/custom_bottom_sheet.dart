import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_dialog.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.isChecked});

  final RxBool isChecked;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              height: 4.h,
              width: 42.w,
              decoration: BoxDecoration(
                color: Color(0x33718096),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextPoppins(
                    text: 'Payment Method',
                    color: AppColors.darkGrey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close_rounded),
                  ),
                ],
              ),
            ),
            Obx(
              () => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AssetPath.stripeIcon,
                            width: 86.w,
                            height: 41.h,
                          ),
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            activeColor: AppColors.primary,
                            value: isChecked.value,
                            onChanged: (value) {
                              isChecked.value = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: CustomButton(
                btnText: 'Confirm and Pay',
                onPressed: () async {
                  if (isChecked.value) {
                    // Get.back();
                    // await StripeService.instance.setupPaymentMethod(
                    //   context: context,
                    // );
                    Get.back();
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(0.0),
                          content: CustomDialog(
                            title: 'Payment Successful',
                            subtitle:
                                'Your payment has been done successfully.',
                            titleColor: AppColors.darkGrey,
                            subtitleColor: AppColors.lightGrey,
                            assetPath: AssetPath.successImg,
                            buttonform: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              child: CustomButton(
                                btnText: 'Give Review',

                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                backgroundColor: AppColors.primary,
                                textColor: Colors.white,
                                btnBorderRadius: 12.r,
                                onPressed: () {
                                  // controller.logoutProcess();
                                  Get.toNamed(Routes.feedBackScreen);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    Get.snackbar(
                      'Plesae check the Gateway Type',
                      'Checkout the Payment Gateways',
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
