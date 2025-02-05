import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';

class BestPerformerDetailScreenController extends GetxController {
  RxString title = "".obs;
  RxString id = "".obs;
  RxBool showChat = true.obs;
  RxBool isLoading = false.obs;
  Map bestPerformers = {};

  List dummyData = [];

  @override
  void onInit() {
    title.value = Get.arguments['title'] ?? "User Detail";
    showChat.value = Get.arguments['showChat'] ?? true;
    id.value = Get.arguments['id'] ?? "";
    getBestPerformersProfile(id.value);
    super.onInit();
  }

  getBestPerformersProfile(id) async {
    try {
      var headers = {'Authorization': token.value};

      isLoading.value = true;
      final uri = Uri.parse("${UserUrls.getBestPerformersProfile}/$id");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        isLoading.value = false;
        bestPerformers = resData['data'];

        dummyData = [
          {
            "title": "Completed Jobs",
            "value": "${bestPerformers['user_details']['completed_jobs']}",
          },
          {
            "title": "Work Type",
            "value": "${bestPerformers['user_details']['worker_type']}",
          },
          {
            "title": "Skills",
            "value": "Interior Designer",
          },
          {
            "title": "Age",
            "value": "${bestPerformers['user_details']['age']}",
          },
          {
            "title": "Gender",
            "value": "${bestPerformers['user_details']['gender']}",
          },
          {
            "title": "Address",
            "value": "${bestPerformers['user_details']['address']}",
          },
          {
            "title": "Country",
            "value": "United States",
          },
          {
            "title": "Email",
            "value": "${bestPerformers['email']}",
          },
          {
            "title": "Phone Number",
            "value": "+1 234 567890",
          },
          {
            "title": "About",
            "value": "${bestPerformers['user_details']['description']}",
          },
        ];
        update();
      } else {
        resData['status'];

        isLoading.value = false;
        update();
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      update();
    }
  }
}
