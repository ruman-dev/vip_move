import 'package:get/get.dart';

class ScheduleController extends GetxController {
  var selectedTimeSlotIndex = (-1).obs;
  var selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }
}
