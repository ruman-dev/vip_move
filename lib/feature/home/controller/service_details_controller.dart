import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/utils/const.dart';
import 'package:vid_move/core/utils/notification.dart';
import 'package:vid_move/feature/home/models/service_details_model.dart';

class ServiceDetailsController extends GetxController {
  var isLoading = false.obs;
  var selectedIndex = 0.obs;
  var ratingList = ['★  All', '★  5', '★  4', '★  3', '★  2', '★  1'].obs;
  Rx<Result> serviceDetailsResult = Result().obs;
  var productId = Get.parameters['productId'];
  var addHourCharge = 0;

  Future<void> fetchServiceDetails() async {
    try {
      if (productId != null) {
        final response = await NetworkCaller().getRequest(Const.SERVICE_DETAILS_URL + productId!);
        if (response.isSuccess) {
          serviceDetailsResult.value = Result.fromJson(response.responseData);
          addHourCharge = serviceDetailsResult.value.service?.addHourCharge ?? 0;
        } else {
          print('Response Data: ${response.responseData}');
        }
      } else {
        NotificationService.notificationMessage('Error!', 'Product Not Found!', Colors.red);
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    isLoading.value = true;
    fetchServiceDetails();
    super.onInit();
  }
}
