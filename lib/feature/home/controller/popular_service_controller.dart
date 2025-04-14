import 'package:get/get.dart';

class PopularServiceController extends GetxController {
  var isLoading = false.obs;
  var selectedIndex = 0.obs;
  var ratingList = ['All', 'Cleaning', 'Repairing', 'Repairingo'].obs;
}
