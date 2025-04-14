import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/const.dart';

import '../../../core/utils/notification.dart';

class ForgotOtpController extends GetxController {
  var isLoading = false.obs;
  final forgetEmail = Get.parameters['email'];
  final otpPinController = TextEditingController();

  Future<void> verifyOTP() async {
    final prefs = await SharedPreferences.getInstance();

    final response = await NetworkCaller().postRequest(Const.VERIFY_OTP_URL, body: {'email': forgetEmail, 'otp': otpPinController.text.trim()});

    if (response.isSuccess) {
      prefs.setString('forgetOtpToken', response.responseData['accessToken']);
      isLoading.value = false;
      Get.offAndToNamed(Routes.createNewPassScreen);
      otpPinController.clear();
    } else {
      isLoading.value = false;
      NotificationService.notificationMessage('Error!', response.errorMessage, Colors.red);
    }
  }

  @override
  void dispose() {
    otpPinController.dispose();
    super.dispose();
  }
}
