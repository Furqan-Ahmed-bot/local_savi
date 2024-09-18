import 'package:get/get.dart';

class PJobDetailController extends GetxController {
  RxBool showBottomButton = false.obs;
  RxBool showActionButton = false.obs;
  RxString status = "".obs;
  RxString buttonText = "".obs;

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

    super.onInit();
  }
}
