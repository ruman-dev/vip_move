import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_service_view.dart';
import 'package:vid_move/core/utils/app_colors.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/all_service/controller/all_service_controller.dart';
import 'package:vid_move/feature/home/controller/home_controller.dart';

class AllServiceScreen extends StatelessWidget {
  AllServiceScreen({super.key});

  final List<Map<String, String>> serviceList = [
    {'image': AssetPath.packingImg, 'title': 'Packing'},
    {'image': AssetPath.loadingImg, 'title': 'Loading'},
    {'image': AssetPath.unloadingImg, 'title': 'Unloading'},
    {'image': AssetPath.deliveryImg, 'title': 'Delivery'},
    {'image': AssetPath.junkImg, 'title': 'Junk Removal'},
    {'image': AssetPath.personImg, 'title': 'Labour Service'},
    {'image': AssetPath.cleanImg, 'title': 'Cleaning'},
    {'image': AssetPath.truckImg, 'title': 'Labor & Truck'},
    {'image': AssetPath.distanceImg, 'title': 'Long distance'},
    {'image': AssetPath.pianoImg, 'title': 'Piano'},
    {'image': AssetPath.safeImg, 'title': 'Safe'},
  ];
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'All Services'),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 30),
                itemCount: _controller.servicesModel.value.updatedServices?.length,
                itemBuilder: (context, index) {
                  final service = _controller.servicesModel.value.updatedServices?[index];
                  return CustomServiceView(imgPath: service?.serviceIcon ?? AssetPath.deliveryImg, title: service?.serviceName ?? 'Dummy', isFullScreen: true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
