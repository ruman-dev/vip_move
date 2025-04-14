import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/const.dart';
import 'package:vid_move/core/utils/notification.dart';

class SignInController extends GetxController {
  var isShowPassIcon = true.obs;
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isShowPassIcon.value = !isShowPassIcon.value;
  }

  Future<void> signInProcess() async {
    final response = await NetworkCaller().postRequest(Const.SIGN_IN_URL, body: {'email': emailController.text.trim(), 'password': passwordController.text.trim()});

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      final token = response.responseData['accessToken'];
      prefs.setString('token', token);
      Get.toNamed(Routes.bottomNavBar);
      emailController.clear();
      passwordController.clear();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      NotificationService.notificationMessage('Error!', response.errorMessage, Colors.red);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
