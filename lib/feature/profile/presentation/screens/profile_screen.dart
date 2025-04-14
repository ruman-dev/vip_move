import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/home/controller/home_controller.dart';
import 'package:vid_move/feature/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Map<String, String>> profileItemList = [
    {'image': AssetPath.userPersonIcon, 'title': 'Edit Profile'},
    {'image': AssetPath.globalIcon, 'title': 'Language'},
    {'image': AssetPath.bellIcon, 'title': 'Push Notifications'},
    {'image': AssetPath.helpIcon, 'title': 'Help Center'},
    {'image': AssetPath.signOutIcon, 'title': 'Logout'},
  ];

  final ProfileController _controller = Get.put(ProfileController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Stack(
                children: [
                  Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(_homeController.userProfileImg.value),
                      radius: screenWidth * 0.12,
                    ),
                  ),
                  Positioned(
                    top: screenWidth * 0.17,
                    left: screenWidth * 0.16,
                    child: Image.asset(AssetPath.editImg, width: 28.w),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Obx(
                () => CustomTextPoppins(
                  text: _homeController.userName.value.toString(),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: AppColors.darkGrey,
                ),
              ),
              Obx(
                () => CustomTextPoppins(
                  text: _homeController.userEmail.value.toString(),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.lightGrey,
                ),
              ),
              SizedBox(height: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, bottom: 8.h),
                      child: CustomTextPoppins(
                        text: 'General',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Get.toNamed(
                                    Routes.editProfileScreen,
                                    parameters: {'profileImage': _homeController.userProfileImg.value},
                                  );
                                  break;
                                case 1:
                                  Get.toNamed(Routes.languageScreen);
                                  break;
                                case 3:
                                  Get.toNamed(Routes.helpScreen);
                                  break;
                                case 4:
                                  showLogOutBottomSheet(context, true.obs, () {
                                    _controller.logOutProcess();
                                  });
                                  break;
                              }
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(profileItemList[index]['image']!, width: 24.w, height: 24.h),
                                  title: CustomTextPoppins(
                                    text: profileItemList[index]['title']!,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: profileItemList[index]['title'] == 'Logout' ? Color(0xFFF75555) : AppColors.darkGrey,
                                  ),
                                  trailing:
                                      profileItemList[index]['title'] == 'Logout'
                                          ? SizedBox()
                                          : profileItemList[index]['title'] == 'Push Notifications'
                                          ? Obx(
                                            () => Transform.scale(
                                              scale: 0.8,
                                              child: Switch(
                                                activeColor: Colors.white,
                                                inactiveTrackColor: Colors.white,
                                                activeTrackColor: AppColors.primary,
                                                value: _controller.isSwitched.value,
                                                onChanged: (value) {
                                                  _controller.toggleSwitch(value);
                                                },
                                              ),
                                            ),
                                          )
                                          : Icon(Icons.keyboard_arrow_right_rounded),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future showLogOutBottomSheet(BuildContext context, RxBool isChecked, void Function() onLogoutTap) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: false,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 3.h,
                width: 35.w,
                decoration: BoxDecoration(color: Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(12.r)),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.01),
              CustomTextPoppins(
                text: 'Logout',
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFF75555),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.01),
              Divider(thickness: 1.2, color: Color(0xFFEEEEEE)),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.03),
                child: CustomTextPoppins(
                  text: 'Are you sure you want to log out?',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGrey,
                ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        btnText: 'Cancel',
                        textColor: AppColors.primary,
                        onPressed: () {},
                        backgroundColor: Color(0xFFE6FBFF),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(child: CustomButton(btnText: 'Yes, Logout', onPressed: onLogoutTap)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
