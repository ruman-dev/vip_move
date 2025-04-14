import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_richtext.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textfield.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/core/validation/validation.dart';
import 'package:vid_move/feature/auth/controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController _controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>
            _controller.isLoading.value
                ? Center(child: SizedBox(height: 60.h, width: 60.w, child: SpinKitCircle(duration: Duration(seconds: 3), size: 60, color: AppColors.primary)))
                : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25.h),
                            Center(child: Container(height: 148.h, width: 148.w, decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AssetPath.appLogo), fit: BoxFit.cover)))),
                            SizedBox(height: 20.h),
                            CustomTextPoppins(text: 'Sign Up', fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
                            CustomTextPoppins(text: 'Hello! Let’s join with us', fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.lightGrey),
                            SizedBox(height: 20.h),
                            CustomTextfield(
                              controller: _controller.userNameController,
                              hintText: 'Full name',
                              validationText: 'Name can\'t be empty',
                              textInputType: TextInputType.name,
                              prefixImage: AssetPath.userIcon,
                            ),
                            SizedBox(height: 12.h),
                            CustomTextfield(
                              controller: _controller.emailController,
                              hintText: 'Enter your email',
                              validationText: 'Email can\'t be empty',
                              textInputType: TextInputType.emailAddress,
                              prefixImage: AssetPath.emailIcon,
                              validator: Validation.validateEmail,
                            ),
                            SizedBox(height: 12.h),
                            Obx(
                              () => CustomTextfield(
                                controller: _controller.passwordController,
                                hintText: 'Enter your password',

                                isObsecure: _controller.isShowPassIcon.value,
                                validator: (value) => Validation.validatePassword(value),
                                prefixImage: AssetPath.lockIcon,
                                suffixImage: _controller.isShowPassIcon.value ? AssetPath.hideIcon : AssetPath.showIcon,

                                onSuffixTap: () {
                                  _controller.togglePasswordVisibility();
                                },
                              ),
                            ),

                            SizedBox(height: 20.h),
                            CustomButton(
                              btnText: 'Sign Up',
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _controller.isLoading.value = true;
                                  _controller.userSignUpProcess();
                                }
                              },
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: CustomRichtext(
                                primaryText: 'Already have an account? ',
                                secondaryText: 'Sign In',
                                primeFontSize: 16.sp,
                                secFontSize: 16.sp,
                                primeFontWeight: FontWeight.w400,
                                secFontWeight: FontWeight.w600,
                                primeTextColor: Color(0xFF7F7F8A),
                                secTextColor: AppColors.primary,
                                onSecPressed: () {
                                  Get.toNamed(Routes.signInScreen);
                                },
                              ),
                            ),
                            SizedBox(height: 20.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Divider(color: Color(0xFFE9EBED), thickness: 2, endIndent: 15)),
                                CustomTextPoppins(text: 'Or', color: AppColors.lightGrey, fontSize: 14.sp, fontWeight: FontWeight.w400),
                                Expanded(child: Divider(color: Color(0xFFE9EBED), thickness: 2, indent: 15)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Center(child: CustomTextPoppins(text: 'Sign Up With', fontSize: 14.sp, color: AppColors.secondaryLightGrey, fontWeight: FontWeight.w500)),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                                    decoration: BoxDecoration(border: Border.all(width: 1, color: Color(0xFFE3E3E9)), borderRadius: BorderRadius.circular(8)),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [Image.asset(AssetPath.googleIcon, width: 24), SizedBox(width: 12.w), CustomTextPoppins(text: 'Google', fontSize: 16.sp, fontWeight: FontWeight.w600)],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                                    decoration: BoxDecoration(border: Border.all(width: 1, color: Color(0xFFE3E3E9)), borderRadius: BorderRadius.circular(8)),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Image.asset(AssetPath.facebookIcon, width: 24),
                                        SizedBox(width: 12.w),
                                        CustomTextPoppins(text: 'Facebook', fontSize: 16.sp, fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
