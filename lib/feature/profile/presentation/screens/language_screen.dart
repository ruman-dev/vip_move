import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/utils/asset_path.dart';
import 'package:vid_move/feature/profile/presentation/widget/custom_option.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final RxList<Map<String, dynamic>> languageList =
      [
        {'image': AssetPath.americaFlag, 'title': 'English'},
        {'image': AssetPath.germanyFlag, 'title': 'German'},
        {'image': AssetPath.polandFlag, 'title': 'Polish'},
        {'image': AssetPath.franceFlag, 'title': 'Frence'},
        {'image': AssetPath.chinaFlag, 'title': 'Chinese'},
      ].obs;
  RxInt selectedMethod = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Select Language'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Options(
                        imagePath: languageList[index]['image'],
                        option: languageList[index]['title'],
                        fontSize: 16.sp,
                        onPressed: () {
                          selectedMethod.value = index;
                          debugPrint(
                            "Selected language: ${languageList[index]['title']}",
                          );
                        },
                        isSelected: selectedMethod.value == index,
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              btnText: 'Save',
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
