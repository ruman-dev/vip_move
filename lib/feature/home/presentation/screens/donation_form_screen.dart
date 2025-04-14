import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_dropdown.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/global_widget/custom_textbox.dart';
import 'package:vid_move/core/global_widget/custom_textfield.dart';
import 'package:vid_move/core/validation/validation.dart';
import 'package:vid_move/feature/home/controller/donation_form_controller.dart';
import 'package:path/path.dart' as path;

import '../../../../core/utils/app_colors.dart';

class DonationFormScreen extends StatelessWidget {
  DonationFormScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final DonationFormController _controller = Get.put(DonationFormController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Fillup Donation Form'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextPoppins(text: 'Upload Photos', fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF20222C)),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _controller.pickImageFromStorage();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),

                          border: Border(
                            bottom: BorderSide(color: Color(0xFFDFE1E7)),
                            top: BorderSide(color: Color(0xFFDFE1E7)),
                            left: BorderSide(color: Color(0xFFDFE1E7)),
                          ),
                        ),
                        child: CustomTextPoppins(
                          text: 'Choose File',
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF00012E),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                        border: Border.all(width: 1, color: Color(0xFFDFE1E7)),
                      ),
                      child: Obx(
                        () =>
                            _controller.selectedImages.isEmpty
                                ? CustomTextPoppins(
                                  text: 'No File Chosen',
                                  textAlign: TextAlign.center,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF00012E),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                                : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ..._controller.selectedImages.map((file) {
                                      return CustomTextPoppins(
                                        text: path.basename(file.path),
                                        textAlign: TextAlign.center,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF00012E),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      );
                                    }),
                                  ],
                                ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPoppins(text: 'Furniture Name', fontSize: 14.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    CustomDropdown(
                      selectedValue: _controller.selectedFurnitureValue ?? 'Type name',
                      items: _controller.furnitureItems,
                      onChanged: _controller.onFurnitureChanged,
                      showLabel: false.obs,
                    ),
                    SizedBox(height: 15.h),
                    CustomTextPoppins(text: 'Donation Type', fontSize: 14.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    CustomDropdown(
                      selectedValue: _controller.selectedDonationValue ?? 'Type name',
                      items: _controller.donationItems,
                      onChanged: _controller.onDonationChanged,
                      showLabel: false.obs,
                    ),
                    SizedBox(height: 15.h),
                    CustomTextPoppins(text: 'About', fontSize: 14.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    CustomTextbox(hint: 'Short Description', controller: _controller.descriptionController),
                    SizedBox(height: 15.h),
                    CustomTextPoppins(text: 'Email', fontSize: 14.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    CustomTextfield(
                      hintText: 'Email',
                      controller: _controller.emailController,
                      validator: Validation.validateEmail,
                    ),
                    SizedBox(height: 15.h),
                    CustomTextPoppins(text: 'Phone', fontSize: 14.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    CustomTextfield(
                      hintText: 'Phone',
                      controller: _controller.phoneController,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 15.h),
                    CustomTextPoppins(text: 'Address', fontSize: 14.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    CustomTextfield(hintText: 'Address', controller: _controller.addressController),
                    SizedBox(height: 15.h),
                    CustomTextPoppins(text: 'City', fontSize: 14.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    CustomTextfield(hintText: 'City', controller: _controller.cityController),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextPoppins(text: 'State/Province', fontSize: 14.sp, fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomTextfield(hintText: 'State/Province', controller: _controller.stateController),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextPoppins(text: 'Postal/Zip Code', fontSize: 14.sp, fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomTextfield(hintText: 'Postal/Zip Code', controller: _controller.zipCodeController),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
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
                          btnText: 'Submit',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _controller.isLoading.value = true;
                              _controller.postDonationData(context);
                            }
                          },
                        ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
