import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class JobCancelScreenController extends GetxController {
  RxInt groupValue = 0.obs;
  RxBool isLoading = false.obs;

  RxString jobId = "".obs;

  @override
  void onInit() {
    getReasons();
    super.onInit();
  }

  getReasons() async {
    jobId.value = Get.arguments['jobId'];

    isLoading.value = true;
    await UserServices.instance.getCancelJobReasons().then((value) {
      ListOfText.value = value;
    });
    isLoading.value = false;
    update();
  }

  cancelJob() {
    UserServices.instance.cancelPerformerJob(
        reasonId: ListOfText.value[groupValue.value], id: jobId.value);
  }

  RxList ListOfText = [].obs;
}
