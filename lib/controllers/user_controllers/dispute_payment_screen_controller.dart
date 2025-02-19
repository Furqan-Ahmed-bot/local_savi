import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisputePaymentScreenController extends GetxController {
  RxString jobId = "".obs;
  @override
  void onInit() {
    super.onInit();
    jobId.value = Get.arguments['jobId'] ?? "";
  }

  TextEditingController reasonCotnroller = TextEditingController();

  RxInt groupValue = 0.obs;
  List ListOfText = [
    "Dispute reason 1",
    "Dispute reason 2",
    "Dispute reason 3",
    "Dispute reason 4",
    "Other"
  ];
}
