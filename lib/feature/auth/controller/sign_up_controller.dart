import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/utils/const.dart';
import 'package:vid_move/core/utils/notification.dart';
import 'package:vid_move/feature/auth/controller/otp_controller.dart';
import 'package:vid_move/feature/auth/presentation/screens/otp_screen.dart';

import '../../../core/routes/routes.dart';

class SignUpController extends GetxController {
  var isShowPassIcon = true.obs;
  var isLoading = false.obs;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isShowPassIcon.value = !isShowPassIcon.value;
  }

  Future<void> userSignUpProcess() async {
    final response = await NetworkCaller().postRequest(
      Const.SIGN_UP_URL,
      body: {'username': userNameController.text.trim(), 'email': emailController.text.trim(), 'password': passwordController.text.trim()},
    );

    if (response.statusCode == 201) {
      isLoading.value = false;
      Get.toNamed(Routes.otpScreen, parameters: {'email': emailController.text.trim()});
    } else {
      isLoading.value = false;
      NotificationService.notificationMessage('Error!', response.errorMessage);
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
