import 'dart:convert';

import 'package:get/get.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';
import 'package:http/http.dart' as http;
import 'package:local_saviors/resources/%20prefrences/auth_prefrences.dart';
import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:local_saviors/utils/constant.dart';

class PMyProfileController extends GetxController {
  PerformerModel performerdata = PerformerModel();

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  setUserData(PerformerModel data) {
    performerdata = data;
    update();

    print(performerdata.email);
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
        setUserData(PerformerModel.fromJson(jsonResponse['data']));
        String skills = "";
        for (int i = 0; i < performerdata.professions!.length; i++) {
          skills = "$skills ${performerdata.professions![i].professionName}";
        }

        dummyData = [
          {
            "title": "Completed Jobs",
            "value": performerdata.userDetails!.completedJobs.toString(),
          },
          {
            "title": "Work Type",
            "value": performerdata.userDetails!.workerType,
          },
          {
            "title": "Skills",
            "value": skills,
          },
          {
            "title": "Age",
            "value": "${performerdata.userDetails!.age.toString()} years old",
          },
          {
            "title": "Gender",
            "value": performerdata.userDetails!.gender,
          },
          {
            "title": "Address",
            "value": performerdata.userDetails!.address,
          },
          {
            "title": "Country",
            "value": performerdata.userDetails!.location,
          },
          {
            "title": "Email",
            "value": performerdata.userDetails!.contactEmail,
          },
          {
            "title": "Phone Number",
            "value": performerdata.userDetails!.contactPhone != null
                ? performerdata.userDetails!.contactPhone
                : "+1 534 54286425",
          },
          {
            "title": "About",
            "value": performerdata.userDetails!.description,
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

  late List dummyData;
}
