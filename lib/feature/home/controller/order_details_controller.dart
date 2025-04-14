import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  var selectedIndex = (-1).obs;
  var isLoading = false.obs;
  var distanceCost = 20.obs;
  final sourceText = Get.parameters['source'];
  final destinationText = Get.parameters['destination'];
  final vehicleTypeText = Get.parameters['vehicleType'];
  final addHourCharge = Get.parameters['addHourCharge'];
  final vehicleCost = Get.parameters['vehicleCharge'].obs;
  final serviceCharge = Get.parameters['serviceCharge'].obs;
  var hourValue = 0.obs;

  String totalCalculate() {
    return (double.tryParse(vehicleCost.value ?? '0.0')! +
            distanceCost.value +
            (double.tryParse(addHourCharge!)! * hourValue.value) +
            double.tryParse(serviceCharge.value ?? '0')!)
        .toStringAsFixed(2);
  }
}
