// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:vid_move/core/global_widget/custom_appbar.dart';
// import 'package:vid_move/feature/search/controller/search_controller.dart';
//
// class SearchScreen extends StatelessWidget {
//   SearchScreen({super.key});
//
//   final SearchScreenController searchScreenController = Get.put(
//     SearchScreenController(),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppbar(title: 'Search'),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: searchScreenController.searchTEController.value,
//               decoration: InputDecoration(hintText: 'Cleaning'),
//               onChanged: (value) {
//                 searchScreenController.addSearchList(searchText: value);
//               },
//             ),
//
//             Expanded(
//               child: Obx(
//                 () => ListView.builder(
//                   itemCount: searchScreenController.searchFilterList.length,
//                   itemBuilder: (context, index) {
//                     final searchItem = searchScreenController.searchFilterList[index];
//                     return Text(
//                       searchItem,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/search/controller/search_controller.dart';
import 'package:wx_divider/wx_divider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController controller = Get.put(SearchScreenController());

  RxList<int> selectedItems = <int>[].obs;
  final Rx<SfRangeValues> _values = Rx<SfRangeValues>(SfRangeValues(100, 500));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            Container(
              height: 55.h,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1.w, color: AppColors.primary),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetPath.searchIcon,
                    width: 20.w,
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(width: 10.h),
                  Expanded(
                    child: TextFormField(
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.text,
                      controller: controller.serviceSearchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.sizeOf(context).width * 0.013,
                        ),
                        hintText: 'Cleaning',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      // onChanged: (value) {
                      //   controller.addSearchList(searchText: value);
                      //
                      //   if (controller.serviceSearchController.text
                      //       .trim()
                      //       .isEmpty) {
                      //     controller.list.clear();
                      //     controller.fetchRecentSearches();
                      //   } else {
                      //     controller.fetchResult(
                      //       controller.serviceSearchController.text.trim(),
                      //     );
                      //   }
                      // },
                      onChanged: (value) {
                        controller.addSearchList(searchText: value);

                        if (controller.serviceSearchController.text
                            .trim()
                            .isEmpty) {
                          controller.list.clear();
                          controller.fetchRecentSearches();
                        } else {
                          controller.fetchResult(
                            controller.serviceSearchController.text.trim(),
                          );
                        }
                      },
                    ),
                  ),
                  WxDivider(
                    direction: Axis.vertical,
                    thickness: 2,
                    color: Color(0xFFE9EBED),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        enableDrag: true,
                        isDismissible: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10.h),
                                  Container(
                                    height: 4.h,
                                    width: 42.w,
                                    decoration: BoxDecoration(
                                      color: Color(0x33718096),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomTextPoppins(
                                    text: 'Filter',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 15.h),
                                  Divider(
                                    color: Color(0xFFEEEEEE),
                                    thickness: 1.w,
                                    endIndent: 16,
                                    indent: 16,
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                        ),
                                        child: CustomTextPoppins(
                                          text: 'Category',
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 10.h,
                                        right: 16.w,
                                        left: 7.h,
                                        top: 10.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          ...controller.categoryList.map((
                                              element,
                                              ) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                              ),
                                              child: Wrap(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .selectedCategoryIndex
                                                          .value = controller
                                                          .categoryList
                                                          .indexOf(element);
                                                    },
                                                    child: Obx(
                                                          () => Container(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 14.w,
                                                          vertical: 6.h,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                          controller
                                                              .selectedCategoryIndex
                                                              .value ==
                                                              controller
                                                                  .categoryList
                                                                  .indexOf(
                                                                element,
                                                              )
                                                              ? AppColors
                                                              .primary
                                                              : Colors
                                                              .white,
                                                          border: Border.all(
                                                            width: 1.5,
                                                            color: Color(
                                                              0xFFE3E3E9,
                                                            ),
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                            30.r,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          element.toString(),
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: GoogleFonts.poppins(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            color:
                                                            controller
                                                                .selectedCategoryIndex
                                                                .value ==
                                                                controller
                                                                    .categoryList
                                                                    .indexOf(
                                                                  element,
                                                                )
                                                                ? Colors
                                                                .white
                                                                : AppColors
                                                                .lightGrey,
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
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                        ),
                                        child: CustomTextPoppins(
                                          text: 'Price',
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Obx(
                                        () => SfRangeSlider(
                                      min: 0.0,
                                      max: 1000.0,
                                      values: _values.value,
                                      interval: 100,
                                      showTicks: false,
                                      showLabels: false,
                                      enableTooltip: true,
                                      activeColor: AppColors.primary,
                                      minorTicksPerInterval: 1,
                                      tooltipTextFormatterCallback: (
                                          dynamic value,
                                          String formattedText,
                                          ) {
                                        return '\$${value.toInt()}';
                                      },
                                      onChanged: (SfRangeValues newValues) {
                                        _values.value = newValues;
                                      },
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                        ),
                                        child: CustomTextPoppins(
                                          text: 'Rating',
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 10.h,
                                        right: 16.w,
                                        left: 7.h,
                                        top: 10.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center, // Center align items
                                        children: [
                                          ...controller.ratingList.map((
                                              element,
                                              ) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                              ),
                                              child: Wrap(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .selectedRatingIndex
                                                          .value = controller
                                                          .ratingList
                                                          .indexOf(element);
                                                    },
                                                    child: Obx(
                                                          () => Container(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 14.w,
                                                          vertical: 6.h,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                          controller
                                                              .selectedRatingIndex
                                                              .value ==
                                                              controller
                                                                  .ratingList
                                                                  .indexOf(
                                                                element,
                                                              )
                                                              ? AppColors
                                                              .primary
                                                              : Colors
                                                              .white,
                                                          border: Border.all(
                                                            width: 1.5,
                                                            color: Color(
                                                              0xFFE3E3E9,
                                                            ),
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                            30.r,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          element.toString(),
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: GoogleFonts.poppins(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            color:
                                                            controller
                                                                .selectedRatingIndex
                                                                .value ==
                                                                controller
                                                                    .ratingList
                                                                    .indexOf(
                                                                  element,
                                                                )
                                                                ? Colors
                                                                .white
                                                                : AppColors
                                                                .lightGrey,
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
                                  SizedBox(height: 20.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            btnText: 'Reset',
                                            textColor: AppColors.primary,
                                            onPressed: () {},
                                            backgroundColor: Color(0xFFE6FBFF),
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        Expanded(
                                          child: CustomButton(
                                            btnText: 'Filter',
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      AssetPath.filterIcon,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPoppins(
                  text: 'Recent',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF212121),
                ),
                GestureDetector(
                  onTap: () {
                    controller.deleteRecentSearches();
                    controller.fetchRecentSearches();
                  },
                  child: CustomTextPoppins(
                    text: 'Clear All',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.searchFilterList.length,

                  itemBuilder: (context, index) {
                    final searchItem = controller.searchFilterList[index];
                    return Container(
                      height: 56.w,
                      width: double.maxFinite.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8).w,
                      ),
                      alignment: Alignment.centerLeft,
                      // padding: EdgeInsets.symmetric(horizontal: 16).w,
                      child: Text(
                        searchItem,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
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
