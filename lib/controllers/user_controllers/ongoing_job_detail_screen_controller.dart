import 'package:get/get.dart';

class OngoingJobDetailScreenController extends GetxController {
  RxBool isReached = false.obs;
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
    // TODO: implement onInit
    super.onInit();
    isReached.value =
        Get.arguments != null ? Get.arguments['isReached'] ?? false : false;
  }
}
