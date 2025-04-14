import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/map/presentation/controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final MapController _controller = Get.put(MapController());

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: '${_controller.day}'),
      body: Obx(
        () =>
            _controller.isLoading.value
                ? Center(
                  child: SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: SpinKitCircle(duration: Duration(seconds: 3), size: 60, color: AppColors.primary),
                  ),
                )
                : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CustomTextPoppins(
                          text: _controller.selectedSlot.toString(),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      Container(
                        height: Get.height - 500,
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                        child: Obx(
                          () => GoogleMap(
                            // initialCameraPosition: _kGoogle,
                            // markers: locationController.markers.value,
                            markers: {
                              Marker(
                                icon: BitmapDescriptor.defaultMarker,
                                markerId: MarkerId("Source"),
                                position: MapController.sourceLocation,
                                onTap: () {
                                  // getAllByCategory(context);
                                },
                              ),
                              Marker(
                                icon: BitmapDescriptor.defaultMarker,
                                markerId: MarkerId("Destination"),
                                position: MapController.destinationLocation,
                                onTap: () {
                                  // getAllByCategory(context);
                                },
                              ),
                            },
                            polylines: {
                              Polyline(
                                polylineId: PolylineId("route"),
                                points: _controller.polylineCoordinates.value,
                                color: Colors.blue, // You must set a color
                                width: 5,
                              ),
                            },
                            mapType: MapType.normal,
                            initialCameraPosition: const CameraPosition(target: MapController.sourceLocation, zoom: 14.5),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.completer.complete(controller);
                              _controller.getPolyLinePoint();
                            },
                            // trafficEnabled: true,
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Form(
                              key: globalKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AssetPath.startingPointIcon, width: 22),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _controller.sourceController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter the source location';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Enter Source Location',
                                            focusColor: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AssetPath.destinationIcon, width: 24),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _controller.destinationController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter the destination location';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Enter Destination Location',
                                            focusColor: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).width * 0.43,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                primary: false,
                                shrinkWrap: true,
                                itemCount: _controller.vehicleModel.value.vehicles?.length,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        _controller.selectedVehicleIndex.value = index;
                                      },
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width * 0.3,
                                        padding: EdgeInsets.all(12),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color:
                                              _controller.selectedVehicleIndex.value == index ? Color(0xFF1B1D21) : Colors.white,
                                          border: Border.all(width: 1, color: Color(0xFFE3E3E9)),
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    _controller.vehicleModel.value.vehicles?[index].imageUrl ?? '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(),
                                            CustomTextPoppins(
                                              text: _controller.vehicleModel.value.vehicles?[index].vehicleName ?? '',
                                              color:
                                                  _controller.selectedVehicleIndex.value == index
                                                      ? Colors.white
                                                      : AppColors.darkGrey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            CustomTextPoppins(
                                              text: '~ ${_controller.vehicleModel.value.vehicles?[index].capacity ?? ''}',
                                              color:
                                                  _controller.selectedVehicleIndex.value == index
                                                      ? Colors.white
                                                      : Color(0xFF636F85),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomButton(
                                btnText: 'Confirm',
                                onPressed: () {
                                  if (globalKey.currentState!.validate()) {
                                    if (_controller.selectedVehicleIndex.value > (-1)) {
                                      _controller.vehicleCharge.value =
                                          _controller.vehicleModel.value.vehicles?[_controller.selectedVehicleIndex.value].cost ??
                                          0;
                                      Get.toNamed(
                                        Routes.orderDetailsScreen,
                                        parameters: {
                                          'source': _controller.sourceController.text,
                                          'destination': _controller.destinationController.text,
                                          'vehicleType':
                                              _controller
                                                  .vehicleModel
                                                  .value
                                                  .vehicles?[_controller.selectedVehicleIndex.value]
                                                  .vehicleName ??
                                              '',
                                          'addHourCharge': _controller.addHourCharge ?? 'NO',
                                          'vehicleCharge': _controller.vehicleCharge.value.toString(),
                                          'serviceCharge': _controller.serviceCharge.toString(),
                                        },
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
