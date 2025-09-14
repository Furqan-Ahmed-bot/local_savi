import 'package:get/get.dart';
import 'package:local_saviors/models/job_performer_model/job_performer_model.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class PHomeController extends GetxController {
  PerformerModel performerdata = PerformerModel();
  List<PerformerJobsModel> listOfJobs = [];
  RxBool isLaoding = false.obs;
  RxList allBookMarked = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  getPerfJobs() async {
    isLaoding.value = true;
    listOfJobs = await UserServices.instance.getPerformerJobs();
    for (var i = 0; i < listOfJobs.length; i++) {
      if (listOfJobs[i].bookMarked == true) {
        if (!allBookMarked.contains(listOfJobs[i].id)) {
          allBookMarked.add(listOfJobs[i].id);
        }
      }
    }

    print("allBookMarked ${allBookMarked.value}");
    isLaoding.value = false;
    update();
  }

  addBookMarkedJobs(jobid) {
    if (allBookMarked.contains(jobid)) {
      allBookMarked.remove(jobid);
    } else {
      allBookMarked.add(jobid);
    }
  }

  setPerformerData(PerformerModel data) {
    performerdata = data;
    update();
  }
}
