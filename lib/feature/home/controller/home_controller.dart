import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/feature/home/models/local_areas_model.dart';

import '../../../core/network_caller/network_caller.dart';
import '../../../core/utils/const.dart';
import '../../all_service/models/all_service_model.dart';
import '../models/popular_services_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var userName = 'UnKnown'.obs;
  var userEmail = 'UnKnown'.obs;
  var userPhone = '(+1) 999 999 999'.obs;
  var userProfileImg = 'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/106361608125f1a7e9a91e3239fa58900b638213'.obs;
  Rx<Result> servicesModel = Result().obs;
  Rx<Result1> localAreasModel = Result1().obs;
  Rx<PopServiceResult> popularServicesModel = PopServiceResult().obs;

  Future<void> fetchServicesData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await NetworkCaller().getRequest(Const.ALL_SERVICES_URL, token: prefs.getString('token'));

      if (response.isSuccess) {
        servicesModel.value = Result.fromJson(response.responseData);
      } else {
        print('Response Error Data: ${response.responseData}');
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchLocalAreas() async {
    try {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await NetworkCaller().getRequest(Const.LOCAL_AREAS_URL);

      if (response.isSuccess) {
        localAreasModel.value = Result1.fromJson(response.responseData);
      } else {
        print('Response Error Data: ${response.responseData}');
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchPopularServices() async {
    try {
      final response = await NetworkCaller().getRequest(Const.POPULAR_SERVICES_URL);
      if (response.isSuccess) {
        popularServicesModel.value = PopServiceResult.fromJson(response.responseData);
      } else {
        print('Response Error Data: ${response.responseData}');
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await NetworkCaller().getRequest(Const.USER_DATA_URL, token: prefs.getString('token'));
      if (response.isSuccess) {
        userName.value = response.responseData['username'];
        userEmail.value = response.responseData['email'];
        userPhone.value = response.responseData['phone'];
        userProfileImg.value = response.responseData['profileImage'];
      } else {
        print('Response Error Data: ${response.responseData}');
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
    fetchServicesData();
    fetchLocalAreas();
    fetchPopularServices();
    fetchUserData();
    super.onInit();
  }
}
