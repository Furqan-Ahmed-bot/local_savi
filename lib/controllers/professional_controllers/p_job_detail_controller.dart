// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_saviors/screens/professional_screens/p_job_detail_screen.dart';
import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:http/http.dart' as http;

class PJobDetailController extends GetxController {
  RxBool showBottomButton = false.obs;
  RxBool showActionButton = false.obs;
  RxBool isLoading = false.obs;
  RxString status = "".obs;
  RxString buttonText = "".obs;
  RxString jobId = "".obs;
  var jobDetailDatail = {};
  RxBool isTraseable = false.obs;

  List dummyData = [
    {
      "title": "Work Type",
      "value": "Professional",
    },
    {
      "title": "Job Budget",
      "value": "\$ 50.00 / hr",
    },
    {
      "title": "Job Time",
      "value": "03:00 pm",
    },
    {
      "title": "Job Date",
      "value": "May 18, 2024",
    },
    {
      "title": "Job Address",
      "value": "204 N Auburn Ave, Farmington, New York, 87401",
    },
  ];

  @override
  void onInit() {
    showActionButton.value = Get.arguments['showActionButton'] ?? false;
    showBottomButton.value = Get.arguments['showBottomButton'] ?? false;
    status.value = Get.arguments['status'] ?? "";
    buttonText.value = Get.arguments['bottomButtonText'] ?? "";
    jobId.value = Get.arguments['jobId'] ?? "";

    getData();
    super.onInit();
  }

  journeyChange(String status) async {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: SizedBox(
              child: spinkit,
            ),
          );
        });

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token.value
    };

    var request =
        http.Request('POST', Uri.parse(UserUrls.journeyStatus + jobId.value));
    request.body = json.encode(
        {"status": status, "latitude": "24.881423", "longitude": "67.067795"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.close(1);
      if (status == "ONTHEWAY") {
        buttonText.value = "Arrived";
      } else if (status == "ARRIVED") {
        buttonText.value = "Mark As Completed";
      } else if (status == "COMPLETED") {
        showThankyouDialog(Get.context);
      }
      Get.snackbar("Success", "Job Status Changed",
          backgroundColor: ColorUtils.white);
    } else {
      var data = jsonDecode(await response.stream.bytesToString());
      data['message'];
      Get.close(1);
      Get.snackbar("Alert", "Something went wrong",
          backgroundColor: ColorUtils.white);
    }
  }

  getData() async {
    isLoading.value = true;
    await UserServices.instance
        .getSingleJobDetail(jobId: jobId.value)
        .then((value) {
      isLoading.value = false;
      jobDetailDatail = value['job'];
      isTraseable.value = value['trackable'];
      isTraseable.value == false
          ? buttonText.value = "On The Way"
          : buttonText.value = "Arrived";
      log("==> jobDetails: ${jobDetailDatail}");
      update();
    });
    isLoading.value = false;

    // update();
  }
}
