import 'dart:convert';

import 'package:get/get.dart';
import 'package:local_saviors/models/job_provider_model/job_provider_model.dart';
import 'package:local_saviors/resources/%20prefrences/auth_prefrences.dart';
import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:local_saviors/utils/constant.dart';

class UserProfileScreenController extends GetxController {
  JobProviderModel userdata = JobProviderModel();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  setUserData(JobProviderModel data) {
    userdata = data;
    update();

    print(userdata.email);
  }

  getData() async {
    try {
      isLoading.value = true;
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getProfileUrl));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody1 = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody1);
      if (response.statusCode == 200) {
        AuthPreferences.saveAuthTokenAndRole(
            token.value, jsonResponse['data']['user_type'], refreshToken.value);
        setUserData(JobProviderModel.fromJson(jsonResponse['data']));

        userData = [
          {
            "title": "Age",
            "value": "${userdata.userDetails!.age.toString()} years old",
          },
          {
            "title": "Gender",
            "value": "Male",
          },
          {
            "title": "Address",
            "value": "${userdata.userDetails!.address.toString()}",
          },
          {
            "title": "Country",
            "value": "${userdata.userDetails!.location.toString()}",
          },
          {
            "title": "Email",
            "value": "${userdata.userDetails!.contactEmail.toString()}",
          },
          {
            "title": "Phone Number",
            "value": "+1 234 567890",
          },
          {
            "title": "About",
            "value": "${userdata.userDetails!.description.toString()}",
          },
        ];

        isLoading.value = false;
        update();
      }
    } catch (e) {
      isLoading.value = false;
      print("==> error: $e");
    }
  }

  late List userData;
}
