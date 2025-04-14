import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/core/utils/const.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_dialog.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/app_colors.dart';

class DonationFormController extends GetxController {
  String? selectedFurnitureValue = '';
  List<String> furnitureItems = ['Regal', 'Otobi', 'Navana'];
  String? selectedDonationValue = '';
  List<String> donationItems = ['Furniture', 'Electronics', 'Arts'];
  RxList<File> selectedImages = <File>[].obs;

  RxString filePath = 'No File Chosen'.obs;
  var isLoading = false.obs;

  void onFurnitureChanged(String? newValue) {
    selectedFurnitureValue = newValue!;
    print(selectedFurnitureValue);
  }

  void onDonationChanged(String? newValue) {
    selectedDonationValue = newValue!;
    print(selectedDonationValue);
  }

  /// TextEditing Controllers

  final descriptionController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  Future<void> postDonationData(BuildContext context) async {
    Map<String, dynamic> donationData = {
      'donationType': selectedDonationValue.toString(),
      'furnitureName': selectedFurnitureValue.toString(),
      'email': emailController.text,
      'description': descriptionController.text,
      'phone': phoneController.text,
      'address': addressController.text,
      'city': cityController.text,
      'province': stateController.text,
      'postal': zipCodeController.text,
    };
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var request = http.MultipartRequest('POST', Uri.parse(Const.DONATION_URL))
        ..headers['Authorization'] = '${prefs.getString('token')}';
      request.fields['bodyData'] = jsonEncode(donationData);

      if (selectedImages.isNotEmpty) {
        for (var file in selectedImages) {
          String mimeType = 'image/jpeg';
          if (file.path.endsWith('.png')) {
            mimeType = 'image/png';
          } else if (file.path.endsWith('.gif')) {
            mimeType = 'image/gif';
          } else if (file.path.endsWith('.bmp')) {
            mimeType = 'image/bmp';
          }

          request.files.add(await http.MultipartFile.fromPath('mediaUrls', file.path, contentType: MediaType.parse(mimeType)));
        }
      }

      final response = await request.send();
      print(response);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.all(0.0),
                content: CustomDialog(
                  title: 'Congratulations!',
                  subtitle: 'You have successfully fill up the donation form. You will get response very soon.',
                  titleColor: AppColors.darkGrey,
                  subtitleColor: AppColors.lightGrey,
                  buttonform: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: CustomButton(
                      btnText: 'Go To Home',
                      onPressed: () {
                        Get.offAllNamed(Routes.bottomNavBar);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }
        selectedImages.clear();
      } else {
        Get.snackbar("Failed", "Something went wrong. Please try again!");
      }
    } catch (e) {
      Get.snackbar("Error", "something went wrong.");
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImageFromStorage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);

    if (result != null && result.files.isNotEmpty) {
      selectedImages.clear();
      for (var pickedFile in result.files) {
        final file = File(pickedFile.path!);
        if (file.existsSync() &&
            (file.path.endsWith('.jpg') ||
                file.path.endsWith('.jpeg') ||
                file.path.endsWith('.png') ||
                file.path.endsWith('.gif') ||
                file.path.endsWith('.bmp'))) {
          selectedImages.add(file);
        }
      }
    } else {
      Get.snackbar('No File Selected', 'Please select image files.');
    }
  }
}
