import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/feature/profile/controller/help_controller.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  final RxList<bool> _isExpandedList = List.generate(8, (index) => false).obs;

  final List<Map<String, String>> faqData = [
    {
      "title": "What is Hamo?",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "title": "How to use Hamo?",
      "subtitle":
          "The Rider operates in select locations. Check our app for availability.",
    },
    {
      "title": "How do I cancel a booking?",
      "subtitle":
          "You can book a ride through our mobile app by selecting your preferred experience.",
    },
    {
      "title": "Is Hamo free to use?",
      "subtitle":
          "Yes, passengers must bring their own cannabis. The Rider does not provide any.",
    },
  ];
  final HelpController _controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Help Center'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ..._controller.categoryList.map((element) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Wrap(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.selectedCategoryIndex.value =
                                    _controller.categoryList.indexOf(element);
                              },
                              child: Obx(
                                () => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        _controller
                                                    .selectedCategoryIndex
                                                    .value ==
                                                _controller.categoryList
                                                    .indexOf(element)
                                            ? AppColors.primary
                                            : Colors.white,
                                    border: Border.all(
                                      width: 1.5,
                                      color:
                                          _controller
                                                      .selectedCategoryIndex
                                                      .value ==
                                                  _controller.categoryList
                                                      .indexOf(element)
                                              ? AppColors.primary
                                              : Color(0xFFE3E3E9),
                                    ),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Text(
                                    element.toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          _controller
                                                      .selectedCategoryIndex
                                                      .value ==
                                                  _controller.categoryList
                                                      .indexOf(element)
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
            SizedBox(height: 10.h),
            TextFormField(
              controller: _controller.searchController,
              cursorColor: AppColors.primary,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Cleaning',
                fillColor: Color(0x4DE3E3E9),
                prefixIcon: Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x4DE3E3E9), width: 2.w),

                  borderRadius: BorderRadius.circular(12.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x4DE3E3E9), width: 2.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x4DE3E3E9), width: 2.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: faqData.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Color(0xFFF9F9FB),
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide.none,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide.none,
                            ),
                            title: Padding(
                              padding: EdgeInsets.all(18.0.r),
                              child: Text(
                                faqData[index]['title']!,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF1A202C),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            initiallyExpanded: _isExpandedList[index],
                            onExpansionChanged: (bool expanded) {
                              _isExpandedList[index] = expanded;
                            },
                            trailing: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                _isExpandedList[index]
                                    ? Icons.arrow_drop_up_rounded
                                    : Icons.arrow_drop_down_rounded,
                                color: AppColors.primary,
                                size: 35.r,
                              ),
                            ),
                            children: [
                              Divider(
                                indent: 17,
                                thickness: 1.5,
                                color: Color(0x33718096),
                              ),
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    faqData[index]['subtitle']!,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: Color(0xFF718096),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
