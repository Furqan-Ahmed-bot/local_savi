import 'package:get/get.dart';

import '../../utils/api_services/user_services.dart';

class InviteUserScreenController extends GetxController {
  List listOfUserRequests = [];
  RxBool isInvite = false.obs;
   var jobId;

  RxBool isLoading = false.obs;
  RxSet<String> invitedUsers = <String>{}.obs;


  @override
  void onInit() {
    jobId = Get.arguments['jobid'];
    getJobDetail();
    // listOfUserRequests = Get.arguments['users'];
    // for (int i  = 0; i < listOfUserRequests.length; i++) {
    //   listOfUserRequests[i]['isInvited'] = false;
    // }
    // update();
    super.onInit();
  }

  getJobDetail() async {
    isLoading.value = true;
    await UserServices.instance
        .getReHire(jobId: jobId)
        .then((value) {
      isLoading.value = false;
      listOfUserRequests = value;

      update();
    });
    isLoading.value = false;
  }


    void markAsInvited(String performerId) {
    invitedUsers.add(performerId);
    update();
  }

  bool isUserInvited(String performerId) {
    return invitedUsers.contains(performerId);
  }
}
