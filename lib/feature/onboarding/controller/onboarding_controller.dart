import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/routes/routes.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  void updatePageIndex(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.offAllNamed(Routes.signInScreen);
    }
  }
}
