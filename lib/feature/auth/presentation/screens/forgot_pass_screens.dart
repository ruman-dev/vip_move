import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textfield.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/core/validation/validation.dart';
import 'package:vid_move/feature/auth/controller/forgot_pass_controller.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final ForgotPassController _controller = Get.put(ForgotPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPoppins(text: 'Forgot Password', color: AppColors.darkGrey, fontSize: 24.sp, fontWeight: FontWeight.w600),
                  SizedBox(height: 10.h),
                  CustomTextPoppins(text: 'Recover your account password', fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.lightGrey),
                  SizedBox(height: 20.h),
                  CustomTextfield(
                    controller: _controller.emailController,
                    hintText: 'Enter your email address',
                    prefixImage: AssetPath.emailIcon,
                    validationText: 'Email can\'t be empty',
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => Validation.validateEmail(value),
                  ),
                  SizedBox(height: 20.h),
                  Obx(
                    () =>
                        _controller.isLoading.value
                            ? Center(child: SizedBox(height: 60.h, width: 60.w, child: SpinKitCircle(duration: Duration(seconds: 3), size: 60, color: AppColors.primary)))
                            : CustomButton(
                              btnText: 'Send OTP',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _controller.isLoading.value = true;
                                  _controller.resetPass();
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
