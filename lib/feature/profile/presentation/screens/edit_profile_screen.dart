import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textfield.dart';
import 'package:vid_move/feature/home/controller/home_controller.dart';
import 'package:vid_move/feature/profile/controller/edit_profile_controller.dart';

import '../../../../core/utils/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final HomeController _homeController = Get.put(HomeController());
  final EditProfileController _controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller.pickImageFromStorage();
                },
                child: Obx(
                  () => CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        _controller.isLocalFile.value
                            ? FileImage(_controller.selectedImage.value!)
                            : NetworkImage(_controller.profileImg),

                    radius: Get.height * 0.05,
                  ),
                ),
              ),

              SizedBox(height: 25.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPoppins(text: 'Full Name', fontSize: 16.sp, fontWeight: FontWeight.w500),
                  SizedBox(height: 10.h),
                  CustomTextfield(hintText: _homeController.userName.value, controller: _controller.userNameController),
                  SizedBox(height: 10.h),
                  CustomTextPoppins(text: 'Email Address', fontSize: 16.sp, fontWeight: FontWeight.w500),
                  SizedBox(height: 10.h),
                  CustomTextfield(hintText: _homeController.userEmail.value, isReadOnly: true),
                  SizedBox(height: 10.h),
                  CustomTextPoppins(text: 'Phone Number', fontSize: 16.sp, fontWeight: FontWeight.w500),
                  SizedBox(height: 10.h),
                  CustomTextfield(hintText: _homeController.userPhone.value, controller: _controller.phoneController),
                ],
              ),
              Spacer(),
              Obx(
                () =>
                    _controller.isLoading.value
                        ? Center(
                          child: SizedBox(
                            height: 60.h,
                            width: 60.w,
                            child: SpinKitCircle(duration: Duration(seconds: 3), size: 60, color: AppColors.primary),
                          ),
                        )
                        : CustomButton(
                          btnText: 'Save Changes',
                          onPressed: () {
                            _controller.isLoading.value = true;
                            _controller.updateUserProfile();
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
