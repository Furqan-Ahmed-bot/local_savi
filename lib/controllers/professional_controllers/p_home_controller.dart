import 'package:get/get.dart';
import 'package:local_saviors/models/job_performer_model/job_performer_model.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class PHomeController extends GetxController {
  PerformerModel performerdata = PerformerModel();
  List<PerformerJobsModel> listOfJobs = [];
  RxBool isLaoding = false.obs;

  getPerfJobs() async {
    isLaoding.value = true;
    listOfJobs = await UserServices.instance.getPerformerJobs();
    isLaoding.value = false;
    update();
  }

  setPerformerData(PerformerModel data) {
    performerdata = data;
    update();
  }
}
