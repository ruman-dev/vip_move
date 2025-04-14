import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/feature/home/presentation/widget/custom_service.dart';

import '../../controller/booking_controller.dart';
import '../../models/booking_model.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.put(BookingController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: CustomTextPoppins(text: 'My Booking'),
          bottom: TabBar(
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            labelStyle: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500),
            tabs: [Tab(text: 'Active'), Tab(text: 'Completed'), Tab(text: 'Cancelled')],
          ),
        ),
        body: Obx(
          () =>
              controller.isLoading.value
                  ? Center(child: SizedBox(height: 60, width: 60, child: SpinKitCircle(color: AppColors.primary)))
                  : TabBarView(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.bookingModel.value.result?.booking?.length,
                              itemBuilder: (context, index) {
                                return CustomService(
                                  imagePath: controller.bookingModel.value.result?.booking?[index].service?.mediaUrls?[0],
                                  price: controller.bookingModel.value.result?.booking?[index].totalCost,
                                  title: controller.bookingModel.value.result?.booking?[index].serviceName,
                                  isBottomButtonActive: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.cancelBookingScreen);
                                          },
                                          child: CustomTextPoppins(
                                            text: 'Cancel Service',
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return CustomService(
                                  isBottomButtonActive: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                        child: CustomTextPoppins(
                                          text: 'Order Again',
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return CustomService();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
        ),
        // Obx(
        //   () =>
        //       controller.isLoading.value
        //           ? Center(child: SizedBox(height: 60, width: 60, child: SpinKitCircle(color: AppColors.primary)))
        //           : TabBarView(
        //             children: [
        //               // Active
        //               buildBookingList(controller.activeBookings, isActive: true),
        //               // Completed
        //               buildBookingList(controller.completedBookings, isCompleted: true),
        //               // Cancelled
        //               buildBookingList(controller.cancelledBookings),
        //             ],
        //           ),
        // ),
      ),
    );
  }

  // Widget buildBookingList(List<Booking> bookings, {bool isActive = false, bool isCompleted = false}) {
  //   return Column(
  //     children: [
  //       SizedBox(height: 10.h),
  //       Expanded(
  //         child:
  //             bookings.isEmpty
  //                 ? Center(child: CustomTextPoppins(text: "No bookings found"))
  //                 : ListView.builder(
  //                   itemCount: bookings.length,
  //                   itemBuilder: (context, index) {
  //                     final booking = bookings[index];
  //                     return CustomService(
  //                       imagePath: booking.service?.mediaUrls?.first,
  //                       price: booking.totalCost,
  //                       title: booking.serviceName,
  //                       isBottomButtonActive:
  //                           isActive
  //                               ? Padding(
  //                                 padding: const EdgeInsets.only(top: 8),
  //                                 child: Align(
  //                                   alignment: Alignment.centerLeft,
  //                                   child: GestureDetector(
  //                                     onTap: () {
  //                                       Get.toNamed(Routes.cancelBookingScreen);
  //                                     },
  //                                     child: Container(
  //                                       padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
  //                                       decoration: BoxDecoration(
  //                                         color: AppColors.primary,
  //                                         borderRadius: BorderRadius.circular(12.r),
  //                                       ),
  //                                       child: CustomTextPoppins(
  //                                         text: 'Cancel Service',
  //                                         color: Colors.white,
  //                                         fontSize: 12.sp,
  //                                         fontWeight: FontWeight.w600,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               )
  //                               : isCompleted
  //                               ? Padding(
  //                                 padding: const EdgeInsets.only(top: 8.0),
  //                                 child: Align(
  //                                   alignment: Alignment.centerLeft,
  //                                   child: Container(
  //                                     padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
  //                                     decoration: BoxDecoration(
  //                                       color: AppColors.primary,
  //                                       borderRadius: BorderRadius.circular(12.r),
  //                                     ),
  //                                     child: CustomTextPoppins(
  //                                       text: 'Order Again',
  //                                       color: Colors.white,
  //                                       fontSize: 12.sp,
  //                                       fontWeight: FontWeight.w600,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               )
  //                               : null,
  //                     );
  //                   },
  //                 ),
  //       ),
  //     ],
  //   );
  // }
}
