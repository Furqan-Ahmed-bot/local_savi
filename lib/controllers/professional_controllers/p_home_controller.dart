import 'package:get/get.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';

class PHomeController extends GetxController {
  PerformerModel performerdata = PerformerModel();

  setPerformerData(PerformerModel data) {
    performerdata = data;
    update();
  }
}
