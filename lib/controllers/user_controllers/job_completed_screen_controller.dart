import 'dart:developer';

import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class JobCompletedScreenController extends GetxController {
  RxString jobId = "".obs;
  var jobDetailDatail = {};
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    jobId.value = Get.arguments['jobId'] ?? "";

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
}
