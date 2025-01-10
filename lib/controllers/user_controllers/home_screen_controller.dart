import 'package:get/get.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../models/job_provider_model/job_provider_model.dart';

class HomeScreenController extends GetxController {
  JobProviderModel userdata = JobProviderModel();

  setUserData(JobProviderModel data) {
    userdata = data;
    update();

    print(userdata.email);
  }

  List dummyData = [
    {
      "name": "Oliver Mark",
      "image": ImageAssets.oliverImg,
      "country": "New York",
      "rating": "(4.5)",
    },
    {
      "name": "William Ray",
      "image": ImageAssets.johnImg,
      "country": "New York",
      "rating": "(4.5)",
    },
    {
      "name": "Esther Wade",
      "image": ImageAssets.oliverImg,
      "country": "New York",
      "rating": "(4.5)",
    },
  ];
}
