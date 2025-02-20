import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class DisputePaymentScreenController extends GetxController {
  RxInt groupValue = 0.obs;
  RxList ListOfReasons = [].obs;

  RxBool isLoading = false.obs;
  RxString jobId = "".obs;

  // cancelJob() async {
  //   await UserServices.instance.cancelPerformerJob(
  //       context: Get.context,
  //       reasonId: ListOfReasons.value[groupValue.value]['id'],
  //       id: jobId.value);
  // }

  getReasons() async {
    isLoading.value = true;
    await UserServices.instance
        .getCancelJobReasons(reason: "DISPUTE")
        .then((value) {
      ListOfReasons.value = value;
    });
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    jobId.value = Get.arguments['jobId'] ?? "";
    getReasons();
  }

  TextEditingController reasonCotnroller = TextEditingController();

  // List ListOfText = [
  //   "Dispute reason 1",
  //   "Dispute reason 2",
  //   "Dispute reason 3",
  //   "Dispute reason 4",
  //   "Other"
  // ];
}
