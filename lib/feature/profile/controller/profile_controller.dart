import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/routes/routes.dart';

class ProfileController extends GetxController {
  var isSwitched = true.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }

  Future<void> logOutProcess() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Get.offAllNamed(Routes.signInScreen);
  }
}
