import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  RxBool isPendingJob = false.obs;
  RxBool showUserDetail = true.obs;

  @override
  void onInit() {
    showUserDetail.value =
        Get.arguments != null ? Get.arguments['showUserDetail'] : true;
    super.onInit();
  }
}
