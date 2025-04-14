import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_searchbar.dart';
import 'package:vid_move/core/global_widget/custom_service_view.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/all_service/controller/all_service_controller.dart';
import 'package:vid_move/feature/home/controller/home_controller.dart';
import 'package:vid_move/feature/home/presentation/widget/custom_local_service.dart';
import 'package:vid_move/feature/home/presentation/widget/custom_popular_service.dart';
import '../../../../core/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
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
                : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: screenWidth * 0.5,
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
                          color: AppColors.primary,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: statusBarHeight),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      DottedBorder(
                                        borderType: BorderType.Circle,
                                        padding: EdgeInsets.all(3.r),
                                        color: Colors.white,
                                        strokeWidth: 1,
                                        dashPattern: [3, 3, 3],
                                        child: CircleAvatar(backgroundImage: NetworkImage(_controller.userProfileImg.value)),
                                      ),
                                      SizedBox(width: 15.w),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomTextPoppins(text: 'Hello,', fontSize: 12.sp, color: Colors.white),
                                            CustomTextPoppins(
                                              text: _controller.userName.value,
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Get.toNamed(Routes.notificationScreen),
                                  child: Image.asset(AssetPath.notificationImg, width: 36.w, height: 36.h),
                                ),
                              ],
                            ),
                            SizedBox(height: screenWidth * 0.09),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.searchScreen);
                                },
                                child: CustomSearchBar(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(AssetPath.homeCardImg), fit: BoxFit.fill),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextPoppins(
                                    text: 'VIP Movers',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGrey,
                                  ),
                                  CustomTextPoppins(
                                    text: 'Services 24/7',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGrey,
                                  ),
                                  CustomTextPoppins(
                                    text: 'Florida’s #1 Moving Company',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkGrey,
                                  ),
                                  SizedBox(height: 10.h),
                                  SizedBox(
                                    width: 120.w,
                                    height: 35.h,
                                    child: CustomButton(
                                      btnText: 'Call Us',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      onPressed: () {},
                                      btnBorderRadius: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25.h),
                            CustomButton(
                              btnText: 'Donation',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              onPressed: () {
                                Get.toNamed(Routes.donationScreen);
                              },
                            ),
                            SizedBox(height: 30.h),
                            Divider(thickness: 1, color: Color(0xFFE3E3E9)),
                            SizedBox(height: 20.h),
                            serviceRow('Our Services', () {
                              Get.toNamed(Routes.allServiceScreen);
                            }),
                            GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 30),
                              primary: false,
                              shrinkWrap: true,
                              itemCount:
                                  (_controller.servicesModel.value.updatedServices?.length ?? 0) < 5
                                      ? _controller.servicesModel.value.updatedServices?.length ?? 0
                                      : 6,
                              itemBuilder: (context, index) {
                                final service = _controller.servicesModel.value.updatedServices?[index];
                                return CustomServiceView(
                                  imgPath: service?.serviceIcon ?? AssetPath.deliveryImg,
                                  title: service?.serviceName ?? 'Dummy',
                                  isFullScreen: false,
                                );
                              },
                            ),

                            serviceRow('Popular Services', () {
                              Get.toNamed(Routes.popularServiceScreen);
                            }),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 200.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  final data = _controller.popularServicesModel.value.popularServices?[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.serviceDetailsScreen, parameters: {'productId': data?.id ?? ''});
                                    },
                                    child: CustomPopularService(
                                      title: _controller.popularServicesModel.value.popularServices?[index].serviceName ?? '',
                                      imgPath: _controller.popularServicesModel.value.popularServices?[index].serviceIcon ?? '',
                                      rating:
                                          _controller.popularServicesModel.value.popularServices?[index].reviews?.length
                                              .toString() ??
                                          '0.0',
                                      averageRating:
                                          _controller.popularServicesModel.value.popularServices?[index].averageRating
                                              .toString() ??
                                          '0',
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomTextPoppins(text: 'Our local service area', fontSize: 18.sp),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).width * 0.7,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _controller.localAreasModel.value.localAreas?.length,
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CustomLocalService(
                                    title: _controller.localAreasModel.value.localAreas?[index].placeName ?? '',
                                    imgPath: _controller.localAreasModel.value.localAreas?[index].imageUrl ?? '',
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

Widget serviceRow(String title, void Function() onTap, [String? endTitle]) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomTextPoppins(text: title, fontSize: 18.sp),
      GestureDetector(
        onTap: onTap,
        child: CustomTextPoppins(
          text: endTitle ?? 'View all',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
      ),
    ],
  );
}
