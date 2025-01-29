import 'dart:developer';

import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class PJobDetailController extends GetxController {
  RxBool showBottomButton = false.obs;
  RxBool showActionButton = false.obs;
  RxBool isLoading = false.obs;
  RxString status = "".obs;
  RxString buttonText = "".obs;
  RxString jobId = "".obs;
  var jobDetailDatail = {};

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

  getData() async {
    isLoading.value = true;
    await UserServices().getSingleJobDetail(jobId: jobId.value).then((value) {
      isLoading.value = false;
      jobDetailDatail = value;
      log("==> jobDetails: ${jobDetailDatail}");
      update();
    });
    isLoading.value = false;

    // update();
  }
}
