import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vid_move/feature/home/controller/home_controller.dart';
import 'package:vid_move/feature/profile/controller/profile_controller.dart';

import '../../../core/utils/const.dart';

class EditProfileController extends GetxController {
  var isLoading = false.obs;
  var isLocalFile = false.obs;
  var profileImg =
      Get.parameters['profileImage'] ??
      'https://www.figma.com/file/toa8HflP0q1bFYfPdNs1FZ/image/106361608125f1a7e9a91e3239fa58900b638213';
  var selectedImage = Rx<File?>(null);
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> updateUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if (token != null) {
      try {
        isLoading.value = true;
        final url = Uri.parse(Const.UPDATE_USER_URL);

        Map<String, dynamic> inputProfileData = {
          "username": userNameController.text.trim(),
          "phone": phoneController.text.trim(),
        };

        var request = http.MultipartRequest('PUT', url);
        request.headers.addAll({'Authorization': token});
        request.fields['bodyData'] = jsonEncode(inputProfileData);

        if (selectedImage.value != null) {
          final file = selectedImage.value!;
          String mimeType = 'image/jpeg';
          if (file.path.endsWith('.png')) {
            mimeType = 'image/png';
          } else if (file.path.endsWith('.gif')) {
            mimeType = 'image/gif';
          } else if (file.path.endsWith('.bmp')) {
            mimeType = 'image/bmp';
          }
          request.files.add(await http.MultipartFile.fromPath('profileImage', file.path, contentType: MediaType.parse(mimeType)));
        }

        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        if (response.statusCode == 200 || response.statusCode == 201) {
          debugPrint('====Success: ${response.body}');
          Get.snackbar("Success", "Profile updated Successfully");
          await Get.find<HomeController>().fetchUserData();
          Get.back();
        } else {
          debugPrint('====Error: ${response.statusCode}, ${response.body}');
        }
      } catch (e) {
        isLoading.value = false;
        debugPrint('====An error occurred: $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> pickImageFromStorage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null && result.files.isNotEmpty) {
      final filePath = result.files.single.path!;
      final file = File(filePath);

      if (file.path.endsWith('.jpg') ||
          file.path.endsWith('.jpeg') ||
          file.path.endsWith('.png') ||
          file.path.endsWith('.gif') ||
          file.path.endsWith('.bmp')) {
        selectedImage.value = file;
      } else {}
    }

    if (selectedImage.value != null) {
      isLocalFile.value = true;
    }

    //   Future<void> pickImageFromStorage() async {
    //   final result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    //
    //   if (result != null && result.files.isNotEmpty) {
    //     for (var pickedFile in result.files) {
    //       final file = File(pickedFile.path!);
    //       if (file.existsSync() &&
    //           (file.path.endsWith('.jpg') ||
    //               file.path.endsWith('.jpeg') ||
    //               file.path.endsWith('.png') ||
    //               file.path.endsWith('.gif') ||
    //               file.path.endsWith('.bmp'))) {
    //         selectedImage.add(file);
    //       }
    //     }
    //   } else {
    //     Get.snackbar('No File Selected', 'Please select image files.');
    //   }
    // }
  }
}
