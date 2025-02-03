import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';

class PJobProvidercontroller extends GetxController {
  RxBool isLoading = false.obs;
  Map jobProviderProfileInfo = {};
  List allActiveJobs = [];
  List userInfo = [];
  List dummyData = [];

  @override
  void onInit() {
    super.onInit();

    getProfileInfo('78245af3-830e-4198-9e7b-3522d7948157'); // Initial profession
  }

  getProfileInfo(userId) async {
    var headers = {'Authorization': token.value};

    isLoading.value = true;
    final uri = Uri.parse("${UserUrls.getJobProviderInfo}/$userId");

    http.Response response = await http.get(uri, headers: headers);
    var resData = json.decode(response.body.toString());
    if (resData['status']['success'] == true) {
      isLoading.value = false;
      jobProviderProfileInfo = resData['data']['user_details'];
      allActiveJobs = resData['data']['user_jobs'];
      dummyData = [
        {
          "title": "Age",
          "value": "${resData['data']['user_details']['age']}",
        },
        {
          "title": "Gender",
          "value": "${resData['data']['user_details']['gender']}",
        },
        {
          "title": "Country",
          "value": "${resData['data']['user_details']['location']}",
        },
        {
          "title": "Email",
          "value": "johnsmitch@domain.com",
        },
        {
          "title": "About",
          "value": "${resData['data']['user_details']['description']}",
        },
      ];
    } else {
      isLoading.value = false;
    }
  }
}
