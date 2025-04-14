import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HelpController extends GetxController {
  var selectedCategoryIndex = 0.obs;
  var categoryList = ['General', 'Account', 'Service', 'Booking'].obs;

  final searchController = TextEditingController();
}
