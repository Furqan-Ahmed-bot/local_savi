import 'dart:convert';

import 'package:get/get.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:http/http.dart' as http;

import '../../models/job_provider_model/job_provider_model.dart';
import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';

class HomeScreenController extends GetxController {
  JobProviderModel userdata = JobProviderModel();
  RxBool isLoading = true.obs;
  RxBool issecondaryLoading = false.obs;
  List listOfActiveJobs = [];
  List bestPerformers = [];

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

  getBestPerformers() async {
    try {
      var headers = {'Authorization': token.value};

      issecondaryLoading.value = true;
      final uri = Uri.parse(UserUrls.getBestPerformers);

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        issecondaryLoading.value = false;
        bestPerformers = resData['data'];
      } else {
        resData['status'];

        issecondaryLoading.value = false;
      }
    } catch (e) {
      issecondaryLoading.value = false;

      print(e);
    }
  }
}
