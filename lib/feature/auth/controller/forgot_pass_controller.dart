import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/utils/app_colors.dart';

import '../../../core/routes/routes.dart';
import '../../../core/utils/const.dart';
import '../../../core/utils/notification.dart';

class ForgotPassController extends GetxController {
  final emailController = TextEditingController();
  var isLoading = false.obs;

  Future<void> resetPass() async {
    isLoading.value = true;
    final response = await NetworkCaller().postRequest(Const.FORGOT_PASS_URL, body: {'email': emailController.text.trim()});

    if (response.isSuccess) {
      isLoading.value = false;
      NotificationService.notificationMessage('Success!', 'OTP sent successfully!', AppColors.primary);
      Get.offAndToNamed(Routes.forgotOtpScreen, parameters: {'email': emailController.text.trim()});
      emailController.clear();
    } else {
      isLoading.value = false;
      NotificationService.notificationMessage('Error!', response.errorMessage, Colors.red);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
