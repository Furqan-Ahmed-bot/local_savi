import 'dart:developer';

import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class CancelledJobScreenController extends GetxController {
  RxBool isPending = false.obs;
  RxBool showCharge = true.obs;
  RxString jobId = "".obs;
  RxBool isLoading = false.obs;
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
    isPending.value = Get.arguments["isPending"] ?? false;
    showCharge.value = Get.arguments["showCharge"] ?? true;
    jobId.value = Get.arguments["jobId"] ?? true;
    getData();
    super.onInit();
  }

  getData() async {
    isLoading.value = true;
    await UserServices.instance
        .getSingleJobDetail(jobId: jobId.value)
        .then((value) {
      isLoading.value = false;
      jobDetailDatail = value['job'];
      log("==> jobDetails: ${jobDetailDatail}");
      update();
    });
    isLoading.value = false;

    // update();
  }
}
