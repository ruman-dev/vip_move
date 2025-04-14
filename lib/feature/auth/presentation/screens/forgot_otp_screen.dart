import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_richtext.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/notification.dart';
import 'package:vid_move/feature/auth/controller/forgot_otp_controller.dart';

class ForgotOtpScreen extends StatelessWidget {
  ForgotOtpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final ForgotOtpController _controller = Get.put(ForgotOtpController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600, color: Colors.black),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 25.h),
                  CustomTextPoppins(text: 'OTP Verification', fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
                  SizedBox(height: 10.h),
                  CustomTextPoppins(text: 'We have sent verification code on', fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.lightGrey),
                  CustomTextPoppins(text: _controller.forgetEmail ?? 'example@info.com', fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.lightGrey),
                  SizedBox(height: 30.h),
                  Center(
                    child: Pinput(
                      controller: _controller.otpPinController,
                      length: 4,

                      defaultPinTheme: defaultPinTheme.copyWith(
                        textStyle: GoogleFonts.poppins(fontSize: 24.sp, color: AppColors.primary, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.w), border: Border.all(color: Color(0xFFE3E3E9), width: 2)),
                      ),

                      focusedPinTheme: defaultPinTheme.copyWith(
                        textStyle: GoogleFonts.poppins(fontSize: 24.sp, color: AppColors.darkGrey, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.w), border: Border.all(color: AppColors.primary, width: 2)),
                      ),

                      showCursor: true,
                      onCompleted: (pin) {
                        debugPrint("Entered OTP: $pin");
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  CustomRichtext(primaryText: 'Don’t receive the OTP? ', secondaryText: 'Resend', secTextColor: Color(0xFF4FBF67), onSecPressed: () {}),
                  SizedBox(height: height * 0.08),
                  Obx(
                    () =>
                        _controller.isLoading.value
                            ? Center(child: SizedBox(height: 60.h, width: 60.w, child: SpinKitCircle(duration: Duration(seconds: 3), size: 60, color: AppColors.primary)))
                            : CustomButton(
                              btnText: 'Verify Code',
                              onPressed: () {
                                String enteredOtp = _controller.otpPinController.text;
                                if (enteredOtp.length == 4) {
                                  _controller.isLoading.value = true;
                                  _controller.verifyOTP();
                                } else {
                                  NotificationService.notificationMessage('Error!', 'Please enter a valid 4-digit OTP.', Colors.red);
                                }
                              },
                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
