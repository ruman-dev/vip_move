import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/utils/const.dart';
import 'package:vid_move/core/utils/notification.dart';

import '../../../core/global_widget/custom_dialog.dart';
import '../../../core/utils/app_colors.dart';

class CreatePassController extends GetxController {
  var isLoading = false.obs;
  var isShowNewPass = true.obs;
  var isShowConfirmPass = true.obs;

  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  void toggleNewPassVisibility() {
    isShowNewPass.value = !isShowNewPass.value;
  }

  void toggleConfirmPassVisibility() {
    isShowConfirmPass.value = !isShowConfirmPass.value;
  }

  Future<void> createNewPassProcess(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await NetworkCaller().patchRequest(Const.UPDATE_PASS_URL, body: {'newPassword': newPassController.text.trim()}, token: prefs.getString('forgetOtpToken'));

    if (response.statusCode == 200) {
      isLoading.value = false;
      if (context.mounted) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(0.0),
              content: CustomDialog(title: 'Success!', subtitle: 'Your password is successfully created', titleColor: AppColors.darkGrey, subtitleColor: AppColors.secondaryLightGrey),
            );
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
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
