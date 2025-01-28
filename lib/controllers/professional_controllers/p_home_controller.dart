import 'package:get/get.dart';
import 'package:local_saviors/models/job_performer_model/job_performer_model.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';

class PHomeController extends GetxController {
  PerformerModel performerdata = PerformerModel();
  List<PerformerJobsModel> listOfJobs = [];

  setPerformerData(PerformerModel data) {
    performerdata = data;
    update();
  }
}
