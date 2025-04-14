import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_dialog.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textfield.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/core/utils/notification.dart';
import 'package:vid_move/core/validation/validation.dart';
import 'package:vid_move/feature/auth/controller/create_pass_controller.dart';

class CreatePassScreen extends StatelessWidget {
  CreatePassScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final CreatePassController _controller = Get.put(CreatePassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, surfaceTintColor: Colors.white),
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
                  CustomTextPoppins(text: 'Create New Password', fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
                  SizedBox(height: 10.h),
                  CustomTextPoppins(text: 'Enter your new password', fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.lightGrey),
                  SizedBox(height: 30.h),
                  Obx(
                    () => CustomTextfield(
                      controller: _controller.newPassController,
                      hintText: 'Enter new password',
                      isObsecure: _controller.isShowNewPass.value,
                      validator: (value) => Validation.validatePassword(value),
                      prefixImage: AssetPath.lockIcon,
                      suffixImage: _controller.isShowNewPass.value ? AssetPath.hideIcon : AssetPath.showIcon,

                      onSuffixTap: () {
                        _controller.toggleNewPassVisibility();
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Obx(
                    () => CustomTextfield(
                      controller: _controller.confirmPassController,
                      hintText: 'Enter confirm password',
                      isObsecure: _controller.isShowConfirmPass.value,
                      validator: (value) => Validation.validatePassword(value),
                      prefixImage: AssetPath.lockIcon,
                      suffixImage: _controller.isShowConfirmPass.value ? AssetPath.hideIcon : AssetPath.showIcon,

                      onSuffixTap: () {
                        _controller.toggleConfirmPassVisibility();
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Obx(
                    () =>
                        _controller.isLoading.value
                            ? Center(child: SizedBox(height: 60.h, width: 60.w, child: SpinKitCircle(duration: Duration(seconds: 3), size: 60, color: AppColors.primary)))
                            : CustomButton(
                              btnText: 'Submit',
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (_controller.newPassController.text == _controller.confirmPassController.text) {
                                    _controller.isLoading.value = true;
                                    _controller.createNewPassProcess(context);
                                  } else {
                                    NotificationService.notificationMessage('Error!', 'Both Password must be matched', Colors.red);
                                  }
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
