import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/utils/app_colors.dart';

import '../../../core/global_widget/custom_dialog.dart';
import '../../../core/utils/const.dart';
import '../../../core/utils/notification.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;
  final otpPinController = TextEditingController();
  final email = Get.parameters['email'];

  Future<void> verifyOTP(BuildContext context) async {
    var data = {'email': email, 'otp': otpPinController.text.trim()};
    final response = await NetworkCaller().postRequest(Const.VERIFY_USER_URL, body: data);

    if (response.isSuccess) {
      isLoading.value = false;
      if (context.mounted) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(contentPadding: EdgeInsets.all(0.0), content: CustomDialog(title: 'Account verified Successfully', titleColor: Color(0xFF171725), subtitleColor: Color(0xFF9CA4AB)));
          },
        );
      } else {
        isLoading.value = false;
        NotificationService.notificationMessage('Error!', response.errorMessage, Colors.red);
      }
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
