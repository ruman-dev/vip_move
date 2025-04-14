import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/onboarding/controller/onboarding_controller.dart';
import 'package:vid_move/feature/onboarding/presentation/widgets/slider_model.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  List<Map<String, dynamic>> sliderData = [
    {
      'image': AssetPath.onboarding1,
      'title': 'Easy Booking & Scheduling',
      'subtitle':
          'Easily schedule pickups with flexible timing, instant booking, and hassle-free recurring transfer options.',
    },
    {
      'image': AssetPath.onboarding2,
      'title': 'Eco-Friendly Moving',
      'subtitle':
          'Sustainable transport with electric vehicles, recyclable packaging & carbon footprint tracking for greener deliveries.',
    },
    {
      'image': AssetPath.onboarding3,
      'title': 'Secure & Reliable Transport',
      'subtitle':
          'Ensure safe deliveries with verified movers, secure packaging, and real-time tracking updates.',
    },
  ];

  final OnboardingController _controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          Obx(
            () =>
                _controller.currentIndex.value != 2
                    ? TextButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.signInScreen);
                      },
                      child: CustomTextPoppins(
                        text: 'Skip',
                        color: AppColors.secondaryLightGrey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    : SizedBox(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller.pageController,
                itemCount: sliderData.length,
                itemBuilder: (context, index) {
                  return SliderModel(
                    image: sliderData[index]['image'],
                    title: sliderData[index]['title'],
                    description: sliderData[index]['subtitle'],
                  );
                },
                onPageChanged: _controller.updatePageIndex,
              ),
            ),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sliderData.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Obx(
                () => CustomButton(
                  btnText:
                      _controller.currentIndex.value == sliderData.length - 1
                          ? "Continue"
                          : "Next",
                  onPressed: () {
                    if (_controller.currentIndex.value ==
                        sliderData.length - 1) {
                      Get.offAllNamed(Routes.signInScreen);
                    }
                    _controller.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      height: 10,
      width: _controller.currentIndex.value == index ? 35 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            _controller.currentIndex.value == index
                ? AppColors.primary
                : Color(0xFFCCECFE),
      ),
      duration: const Duration(milliseconds: 150),
    );
  }
}
