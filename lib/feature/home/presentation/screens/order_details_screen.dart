import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_bottom_sheet.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/home/controller/order_details_controller.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key});

  final OrderDetailsController _controller = Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Order Details'),
      body: Obx(
        () =>
            _controller.isLoading.value
                ? Center(
                  child: SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: SpinKitCircle(duration: Duration(seconds: 3), size: 60, color: AppColors.primary),
                  ),
                )
                : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 15.h),
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(AssetPath.startingPointIcon, width: 20.w),
                                      SizedBox(height: 5.h),
                                      for (var i = 0; i < 5; i++)
                                        Column(
                                          children: [Icon(Icons.circle, color: Colors.green, size: 3.r), SizedBox(height: 2.h)],
                                        ),
                                      SizedBox(height: 5.h),
                                      Image.asset(AssetPath.destinationIcon, width: 20.w),
                                    ],
                                  ),
                                  SizedBox(width: 10.h),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextPoppins(
                                          text: _controller.sourceText!,
                                          color: AppColors.darkGrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 14.h),
                                          child: Container(height: 1, width: double.maxFinite, color: Color(0xFFE3E3E9)),
                                        ),
                                        CustomTextPoppins(
                                          text: _controller.destinationText!,
                                          color: AppColors.darkGrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextPoppins(
                                        text: 'Order Details',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                backgroundColor: Colors.white,
                                                content: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                                                  child: SizedBox(
                                                    height: MediaQuery.sizeOf(context).width * 0.55,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CustomTextPoppins(
                                                          text: 'Add Additional Hour',
                                                          fontSize: 18.sp,
                                                          fontWeight: FontWeight.w600,
                                                          color: AppColors.darkGrey,
                                                        ),
                                                        SizedBox(height: 20),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            CustomTextPoppins(
                                                              text: 'Select Hour',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 14.sp,
                                                              color: AppColors.lightGrey,
                                                            ),
                                                            Row(
                                                              children: [
                                                                IconButton(
                                                                  onPressed: () {
                                                                    if (_controller.hourValue.value > 0) {
                                                                      _controller.hourValue.value--;
                                                                    }
                                                                  },
                                                                  icon: Icon(Icons.remove, size: 20),
                                                                  color: Color(0xFF01CDFF),
                                                                  style: ButtonStyle(
                                                                    backgroundColor: WidgetStateProperty.all(Color(0x4501CDFF)),
                                                                    shape: WidgetStateProperty.all(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    padding: WidgetStateProperty.all(EdgeInsets.all(4)),
                                                                    minimumSize: WidgetStateProperty.all(Size(32, 32)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                                                  child: Obx(
                                                                    () => CustomTextPoppins(
                                                                      text: _controller.hourValue.value.toString(),
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed: () {
                                                                    if (_controller.hourValue.value < 3) {
                                                                      _controller.hourValue.value++;
                                                                    }
                                                                  },
                                                                  icon: Icon(Icons.add, size: 20),
                                                                  color: Colors.white,
                                                                  style: ButtonStyle(
                                                                    backgroundColor: WidgetStateProperty.all(Color(0xFF01CDFF)),
                                                                    shape: WidgetStateProperty.all(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    padding: WidgetStateProperty.all(EdgeInsets.all(4)),
                                                                    minimumSize: WidgetStateProperty.all(Size(32, 32)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 20),
                                                        CustomButton(
                                                          btnText: 'Submit',
                                                          onPressed: () {
                                                            print(_controller.hourValue.value);
                                                            Get.back();
                                                          },
                                                          btnBorderRadius: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: CustomTextPoppins(
                                            text: 'Add Extra Hour',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0xFFE3E3E9)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextPoppins(
                                        text: 'Vehicle (${_controller.vehicleTypeText})',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                      Obx(
                                        () => CustomTextPoppins(
                                          text: '\$${double.tryParse(_controller.vehicleCost.value!)?.toStringAsFixed(2)}',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF2D2D2D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextPoppins(
                                        text: 'Distance Cost',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                      CustomTextPoppins(
                                        text: '\$${_controller.distanceCost.value.toStringAsFixed(2)}',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextPoppins(
                                        text: 'Additional Hours Cost',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                      Obx(
                                        () => CustomTextPoppins(
                                          text:
                                              '\$${(_controller.hourValue.value * double.parse(_controller.addHourCharge ?? '1')).toStringAsFixed(2)}',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF2D2D2D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0xFFE3E3E9)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextPoppins(
                                        text: 'Service Charge',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                      CustomTextPoppins(
                                        text: '\$${double.tryParse(_controller.serviceCharge.value!)?.toStringAsFixed(2)}',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0xFFE3E3E9)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextPoppins(
                                            text: 'Total ',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF2D2D2D),
                                          ),
                                          CustomTextPoppins(
                                            text: '(Estimated Cost)',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkGrey,
                                          ),
                                        ],
                                      ),
                                      CustomTextPoppins(
                                        text: '\$${_controller.totalCalculate()}',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Obx(
                        () => Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _controller.selectedIndex.value = 0;
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    // boxShadow: [],
                                    border: Border.all(
                                      strokeAlign: BorderSide.strokeAlignInside,
                                      width: 2,
                                      color: _controller.selectedIndex.value == 0 ? AppColors.primary : Colors.transparent,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        AssetPath.bankCardIcon,
                                        width: 30.sp,
                                        color: _controller.selectedIndex.value == 0 ? AppColors.darkGrey : Color(0xFFD9D9D9),
                                      ),
                                      SizedBox(height: 5.h),
                                      CustomTextPoppins(
                                        text: 'Online Payment',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.ellipsis,
                                        color: _controller.selectedIndex.value == 0 ? AppColors.darkGrey : AppColors.lightGrey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.h),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _controller.selectedIndex.value = 1;
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      strokeAlign: BorderSide.strokeAlignInside,
                                      width: 2,
                                      color: _controller.selectedIndex.value == 1 ? AppColors.primary : Colors.transparent,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        AssetPath.cashIcon,
                                        width: 30.sp,
                                        color: _controller.selectedIndex.value == 1 ? AppColors.darkGrey : Color(0xFFD9D9D9),
                                      ),
                                      SizedBox(height: 5.h),
                                      CustomTextPoppins(
                                        text: 'Cash',
                                        fontSize: 12.sp,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        color: _controller.selectedIndex.value == 1 ? AppColors.darkGrey : AppColors.lightGrey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        btnText: 'Confirm (\$${double.tryParse(_controller.totalCalculate())?.toStringAsFixed(0)})',
                        onPressed: () {
                          if (_controller.selectedIndex.value == 0) {
                            dialogShow(context, true.obs);
                          } else if (_controller.selectedIndex.value == 1) {
                            // Actions of cash on delivery
                          } else {
                            Get.snackbar(
                              'Error!',
                              'Please select a method',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
      ),
    );
  }
}

Future dialogShow(BuildContext context, RxBool isChecked) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    builder: (context) => CustomBottomSheet(isChecked: isChecked),
  );
}
