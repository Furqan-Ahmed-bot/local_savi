import 'package:get/get.dart';
import 'package:local_saviors/models/job_performer_model/job_performer_model.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';

class PHomeController extends GetxController {
  PerformerModel performerdata = PerformerModel();
  List<PerformerJobsModel> listOfJobs = [];
  RxBool isLaoding = false.obs;

  @override
  void onInit() {
    print('======> pHomecontroller:  length: ${listOfJobs.length}');
    super.onInit();
  }

  setPerformerData(PerformerModel data) {
    performerdata = data;
    update();
  }
}
