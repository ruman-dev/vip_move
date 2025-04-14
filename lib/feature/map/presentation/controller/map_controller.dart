import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vid_move/core/utils/const.dart';

import '../../../../core/network_caller/network_caller.dart';
import '../../../../core/utils/notification.dart';
import '../../../home/models/order_details_model.dart';

class MapController extends GetxController {
  final day = Get.parameters['date'];
  final selectedSlot = Get.parameters['slot'];
  final addHourCharge = Get.parameters['addHourCharge'];
  final serviceCharge = Get.parameters['serviceCharge'];
  var isLoading = false.obs;
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  var vehicleCharge = 0.obs;
  final Completer<GoogleMapController> completer = Completer();
  RxList<LatLng> polylineCoordinates = <LatLng>[].obs;
  Rx<VehicleResult> vehicleModel = VehicleResult().obs;

  static const LatLng sourceLocation = LatLng(22.3752, 91.8349);
  static const LatLng destinationLocation = LatLng(25.7494, 89.2611);

  var selectedVehicleIndex = (-1).obs;

  void switchVehicle(int index) {
    selectedVehicleIndex.value = index;
    print(selectedVehicleIndex.value);
  }

  Future<void> getPolyLinePoint() async {
    PolylinePoints polylinePoints = PolylinePoints();

    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: Const.GOOGLE_API_KEY,
        request: PolylineRequest(
          origin: PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
          destination: PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
          mode: TravelMode.driving,
        ),
      );

      if (result.points.isNotEmpty) {
        polylineCoordinates.value = result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();
      }
    } catch (e) {
      print('Error getting polyline: $e');
    }
  }

  Future<void> fetchVehicleData() async {
    try {
      final response = await NetworkCaller().getRequest(Const.VEHICLE_URL);
      if (response.isSuccess) {
        vehicleModel.value = VehicleResult.fromJson(response.responseData);

        print(selectedVehicleIndex.value);
        print('----------------------------------------${vehicleCharge.value}');
      } else {
        NotificationService.notificationMessage('Error', response.errorMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    sourceController.dispose();
    destinationController.dispose();

    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    fetchVehicleData();
  }
}
