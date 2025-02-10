import 'package:get/get.dart';
import 'package:local_saviors/models/bookmark_model.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class PSavedJobsController extends GetxController {
  RxBool isLoading = false.obs;
  List<BookMarkModel> listOfBookMark = [];

  @override
  void onInit() {
    getBookkmarks();
    super.onInit();
  }

  getBookkmarks() async {
    isLoading.value = true;
    await UserServices.instance.getProfessionalBookmarks().then((value) {
      isLoading.value = false;
      if (value.isNotEmpty) {
        listOfBookMark = value;
      }
    });
    isLoading.value = false;
    update();
  }
}
