import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/color_utils.dart';
import '../../utils/constant.dart';

class ChangePassController extends GetxController {
  RxBool isCurrentPassVisile = false.obs;
  RxBool isNewPassVisile = false.obs;
  RxBool isConfirmPassVisile = false.obs;

  final oldPassWordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  changePassword(context) async {
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "Error",
        "New password and confirm password do not match",
        backgroundColor: ColorUtils.red,
        colorText: ColorUtils.white,
      );
      return; // Exit the function if passwords do not match
    }

    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {'Content-Type': 'application/json', 'Authorization': token.toString()};
      var request = http.Request('POST', Uri.parse(UserUrls.changePassword));
      request.body = json.encode({"old_password": oldPassWordController.text, "password": confirmPasswordController.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        Get.snackbar("Alert", 'Password Change Succsessfully', backgroundColor: ColorUtils.white);
      } else {
        //  Get.close(1);
        Get.back();
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.back();
      debugPrint("==> error: ${e.toString()}");
    }
  }
}
