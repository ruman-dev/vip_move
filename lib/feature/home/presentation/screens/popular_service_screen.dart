import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/feature/home/controller/home_controller.dart';
import 'package:vid_move/feature/home/controller/popular_service_controller.dart';
import 'package:vid_move/feature/home/presentation/screens/service_details_screen.dart';
import 'package:vid_move/feature/home/presentation/widget/custom_service.dart';

class PopularServiceScreen extends StatelessWidget {
  PopularServiceScreen({super.key});

  final PopularServiceController _controller = Get.put(PopularServiceController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Popular Services'),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: EdgeInsets.only(bottom: 10.h, right: 16.w, left: 7.h, top: 10.h),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         ..._controller.ratingList.map((element) {
            //           return Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 5.w),
            //             child: Wrap(
            //               children: [
            //                 GestureDetector(
            //                   onTap: () {
            //                     _controller.selectedIndex.value = _controller.ratingList.indexOf(element);
            //                   },
            //                   child: Obx(
            //                     () => Container(
            //                       padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            //                       decoration: BoxDecoration(
            //                         color:
            //                             _controller.selectedIndex.value == _controller.ratingList.indexOf(element)
            //                                 ? AppColors.primary
            //                                 : Colors.white,
            //                         border: Border.all(width: 1.5, color: Color(0xFFE3E3E9)),
            //                         borderRadius: BorderRadius.circular(30.r),
            //                       ),
            //                       child: Text(
            //                         element.toString(),
            //                         textAlign: TextAlign.center,
            //                         style: GoogleFonts.poppins(
            //                           fontSize: 16.sp,
            //                           fontWeight: FontWeight.w600,
            //                           color:
            //                               _controller.selectedIndex.value == _controller.ratingList.indexOf(element)
            //                                   ? Colors.white
            //                                   : AppColors.lightGrey,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }),
            //       ],
            //     ),
            //   ),
            // ),
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
                      : Expanded(
                        child: ListView.builder(
                          itemCount: _homeController.popularServicesModel.value.popularServices?.length,
                          itemBuilder: (context, index) {
                            final data = _homeController.popularServicesModel.value.popularServices?[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.serviceDetailsScreen, parameters: {'productId': data?.id ?? ''});
                              },
                              child: CustomService(
                                imagePath: data?.serviceIcon,
                                title: data?.serviceName,
                                price: data?.price,
                                rating: data?.averageRating,
                              ),
                            );
                          },
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
