import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class PCancelJobReasonController extends GetxController {
  RxInt groupValue = 0.obs;
  RxList ListOfText = [].obs;

  RxBool isLoading = false.obs;
  RxString jobId = "".obs;

  @override
  void onInit() {
    getReasons();
    super.onInit();
  }

  cancelJob() async {
    await UserServices.instance.cancelPerformerJob(
        context: Get.context,
        reasonId: ListOfText.value[groupValue.value]['id'],
        id: jobId.value);
  }

  getReasons() async {
    jobId.value = Get.arguments['JobId'];
    isLoading.value = true;
    await UserServices.instance.getCancelJobReasons().then((value) {
      ListOfText.value = value;
    });
    isLoading.value = false;
    update();
  }
}
