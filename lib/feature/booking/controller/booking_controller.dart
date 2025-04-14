import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/utils/notification.dart';
import 'package:vid_move/feature/booking/models/booking_model.dart';

import '../../../core/network_caller/network_caller.dart';
import '../../../core/utils/const.dart';

class BookingController extends GetxController {
  Rx<BookingModel> bookingModel = BookingModel().obs;
  var isLoading = false.obs;

  Future<void> fetchServiceDetails() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await NetworkCaller().getRequest(Const.BOOKING_URL, token: prefs.getString('token'));
      print('Response : ${response.toString()}');
      if (response.isSuccess) {
        bookingModel.value = BookingModel.fromJson(response.responseData);
        print(bookingModel.value);
      } else {
        print(response.responseData);
        NotificationService.notificationMessage('Error!', response.errorMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    print('--Hello--');
    isLoading.value = true;
    print(Const.BOOKING_URL);

    fetchServiceDetails();
    print(bookingModel.value.result?.booking?[0].totalCost);
  }

  // List<Booking> get activeBookings => bookingModel.value.result?.booking?.where((b) => b.status == 'active').toList() ?? [];
  //
  // List<Booking> get completedBookings => bookingModel.value.result?.booking?.where((b) => b.status == 'completed').toList() ?? [];
  //
  // List<Booking> get cancelledBookings => bookingModel.value.result?.booking?.where((b) => b.status == 'cancelled').toList() ?? [];
}
