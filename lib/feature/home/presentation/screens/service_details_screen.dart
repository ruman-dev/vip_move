import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_richtext.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/home/controller/service_details_controller.dart';
import 'package:vid_move/feature/home/presentation/screens/schedule_screen.dart';

class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({super.key});

  final ServiceDetailsController _controller = Get.put(ServiceDetailsController());

  @override
  Widget build(BuildContext context) {
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
                      Stack(
                        children: [
                          ImageSlideshow(
                            width: double.infinity,
                            height: Get.height * 0.4,
                            initialPage: 0,
                            indicatorColor: Colors.blue,
                            indicatorBackgroundColor: Colors.grey,
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: [
                              for (int i = 0; i < _controller.serviceDetailsResult.value.service!.mediaUrls!.length; i++)
                                Image.network(_controller.serviceDetailsResult.value.service!.mediaUrls![i], fit: BoxFit.fill),
                            ],
                          ),
                          Positioned(
                            top: 50,
                            left: 5,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.arrow_back, color: Colors.white),
                                ),
                                SizedBox(width: 10.h),
                                CustomTextPoppins(
                                  text: 'Services Details',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextPoppins(
                                  text: _controller.serviceDetailsResult.value.service?.serviceName ?? '',
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomTextPoppins(
                                  text: '\$${_controller.serviceDetailsResult.value.service?.price?.toStringAsFixed(2) ?? ''}',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomTextPoppins(
                                    text: _controller.serviceDetailsResult.value.service?.providerName ?? '',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGrey,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(AssetPath.starIcon, width: 16.w),
                                    SizedBox(width: 5.w),
                                    FittedBox(
                                      child: CustomTextPoppins(
                                        text:
                                            '${_controller.serviceDetailsResult.value.averageRating ?? 0.0} (${_controller.serviceDetailsResult.value.service?.reviews?.length.toString() ?? '0'} reviews)',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightGrey,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: AppColors.primary),
                                SizedBox(width: 5.h),
                                Expanded(
                                  child: CustomTextPoppins(
                                    text: _controller.serviceDetailsResult.value.service?.location ?? '',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGrey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Image.asset(AssetPath.laborIcon, width: 20),
                                      SizedBox(width: 5.h),
                                      CustomTextPoppins(
                                        text: '${_controller.serviceDetailsResult.value.service?.labors ?? ''} Labor',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightGrey,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Image.asset(AssetPath.timerIcon, width: 20),
                                      SizedBox(width: 5.h),
                                      CustomTextPoppins(
                                        text: '${_controller.serviceDetailsResult.value.service?.hours ?? ''} Hours',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightGrey,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomTextPoppins(
                              text: 'About me',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D2D2D),
                            ),
                            SizedBox(height: 10.h),
                            CustomRichtext(
                              primaryText: '${_controller.serviceDetailsResult.value.service?.description} ' ?? '',
                              secondaryText: 'Read more...',
                              secTextColor: AppColors.primary,
                              primeTextColor: AppColors.lightGrey,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextPoppins(
                                  text: 'Photos & Videos',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2D2D2D),
                                ),
                                CustomTextPoppins(
                                  text: 'See All',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF01CDFF),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: MediaQuery.sizeOf(context).width * 0.75,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              _controller.serviceDetailsResult.value.service?.mediaUrls?[0] ??
                                                  'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/e35cdc476bdd4f254c9b149d246e534b3754c4f4',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: MediaQuery.sizeOf(context).width * 0.35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              _controller.serviceDetailsResult.value.service?.mediaUrls?[1] ??
                                                  'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/e35cdc476bdd4f254c9b149d246e534b3754c4f4',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: MediaQuery.sizeOf(context).width * 0.05),
                                      Container(
                                        height: MediaQuery.sizeOf(context).width * 0.35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              _controller.serviceDetailsResult.value.service?.mediaUrls?[1] ??
                                                  'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/e35cdc476bdd4f254c9b149d246e534b3754c4f4',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: MediaQuery.sizeOf(context).width * 0.35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/e35cdc476bdd4f254c9b149d246e534b3754c4f4',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: MediaQuery.sizeOf(context).width * 0.05),
                                      Container(
                                        height: MediaQuery.sizeOf(context).width * 0.35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/e35cdc476bdd4f254c9b149d246e534b3754c4f4',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: MediaQuery.sizeOf(context).width * 0.75,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/e35cdc476bdd4f254c9b149d246e534b3754c4f4',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Image.asset(AssetPath.starIcon, width: 20.w),
                                SizedBox(width: 5.w),
                                CustomTextPoppins(
                                  text:
                                      '${_controller.serviceDetailsResult.value.averageRating ?? 0.0} (${_controller.serviceDetailsResult.value.service?.reviews?.length.toString() ?? '0'} reviews)',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightGrey,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.h, right: 16.w, top: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Center align items
                                  children: [
                                    ..._controller.ratingList.map((element) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: Wrap(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _controller.selectedIndex.value = _controller.ratingList.indexOf(element);
                                              },
                                              child: Obx(
                                                () => Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        _controller.selectedIndex.value == _controller.ratingList.indexOf(element)
                                                            ? AppColors.primary
                                                            : Colors.white,
                                                    border: Border.all(width: 1.5, color: Color(0xFFE3E3E9)),
                                                    borderRadius: BorderRadius.circular(30.r),
                                                  ),
                                                  child: Text(
                                                    element.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color:
                                                          _controller.selectedIndex.value ==
                                                                  _controller.ratingList.indexOf(element)
                                                              ? Colors.white
                                                              : AppColors.lightGrey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _controller.serviceDetailsResult.value.service?.reviews?.length,
                              itemBuilder: (context, index) {
                                final data = _controller.serviceDetailsResult.value.service?.reviews?[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20.r,
                                              backgroundImage: NetworkImage(
                                                data?.user?.profileImage ??
                                                    'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/ca9a34c03954df36efaf653d5cf2fca784d4bdf3',
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            CustomTextPoppins(
                                              text: data?.user?.username ?? 'Thad Endings',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1.5, color: AppColors.primary),
                                            borderRadius: BorderRadius.circular(30.r),
                                          ),
                                          child: CustomTextPoppins(
                                            text: '★  ${data?.rating ?? 0}',
                                            textAlign: TextAlign.center,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomTextPoppins(
                                      text:
                                          data?.comment ??
                                          'Awesome! this is what i was looking for, i recommend to everyone ❤️❤️️❤️',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightGrey,
                                    ),
                                    SizedBox(height: 5.h),
                                    CustomTextPoppins(
                                      text: data?.timeRemaining ?? '',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lightGrey,
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                );
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    btnText: 'Cancel',
                                    textColor: AppColors.primary,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    backgroundColor: Color(0xFFE6FBFF),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: CustomButton(
                                    btnText: 'Book Now',
                                    onPressed: () {
                                      Get.to(
                                        () => ScheduleScreen(
                                          addHourCharge: _controller.addHourCharge,
                                          serviceCharge: _controller.serviceDetailsResult.value.service?.price?.toDouble() ?? 0.0,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget buildImage(String path) {
    return Container(
      margin: EdgeInsets.all(4),
      child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(path, fit: BoxFit.cover)),
    );
  }
}
