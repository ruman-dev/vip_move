import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/network_caller/network_caller.dart';
import 'package:vid_move/core/utils/const.dart';
import 'package:vid_move/core/utils/notification.dart';
import 'package:vid_move/feature/all_service/models/all_service_model.dart';

class SearchScreenController extends GetxController {
  var selectedCategoryIndex = 0.obs;
  var selectedRatingIndex = 0.obs;
  var categoryList = ['All', 'Cleaning', 'Repairing', 'Electronics'].obs;
  var ratingList = ['★  All', '★  5', '★  4', '★  3', '★  2', '★  1'].obs;
  var list = [].obs;
  var recentSearch = [].obs;

  Rx<AllServicesModel> serviceModel = AllServicesModel().obs;

  final TextEditingController serviceSearchController = TextEditingController();

  Future<void> fetchResult(String searchText) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await NetworkCaller().getRequest(Const.ALL_SERVICES_URL, token: prefs.getString('token'));

    if (response.isSuccess) {
      final List<dynamic> updatedServices = response.responseData['updatedServices'];
      Set<String> uniqueNames = {};

      for (var service in updatedServices) {
        if (service['serviceName'] != null) {
          uniqueNames.add(service['serviceName']);
        }
      }
      list.value = uniqueNames.toList();
      print('List Values: $list');
    } else {
      list.clear();
    }
  }

  Future<void> fetchRecentSearches() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await NetworkCaller().getRequest(Const.SEARCH_URL, token: prefs.getString('token'));
    print('Recent Response : $response');
    if (response.isSuccess) {
      var length = response.responseData['searches'].length;

      for (int i = 0; i < length; i++) {
        final searchData = response.responseData['searches'][i]['searchTerm'];
        recentSearch.add(searchData);
      }
      print('Recent Search: $recentSearch');
    } else {
      recentSearch.clear();
    }
  }

  Future<void> deleteRecentSearches() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await NetworkCaller().deleteRequest(Const.DEL_ALL_SEARCH_URL, body: {}, token: prefs.getString('token'));

    if (response.isSuccess) {
      print('Cleared');
      NotificationService.notificationMessage('Success', 'Search results cleared!');
    } else {
      NotificationService.notificationMessage('Success', response.errorMessage, Colors.red);
    }
  }

  @override
  void onInit() {
    fetchRecentSearches();
    super.onInit();
  }

  @override
  void dispose() {
    serviceSearchController.dispose();
    super.dispose();
  }
}
