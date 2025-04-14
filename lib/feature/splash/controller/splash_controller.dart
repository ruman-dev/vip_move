import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Get.put(NetworkCaller());
    splashNavigate();
    // navigate();
  }

  //   void navigate() {
  //     Future.delayed(const Duration(seconds: 3), () {
  //       Get.offAllNamed(Routes.onboardingScreen);
  //     });
  //   }
  // }

  Future<void> splashNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    if (token != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.bottomNavBar);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.onboardingScreen);
      });
    }
  }
}
