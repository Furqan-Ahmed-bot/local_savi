// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';

class TermsConditionController extends GetxController {
  RxBool isLoading = false.obs;
  Map termsAndcondition = {}.obs;

  @override
  void onInit() {
    getTermsAndConditions();
    super.onInit();
  }

  getTermsAndConditions() async {
    try {
      var headers = {'Authorization': token.value};

      isLoading.value = true;
      final uri = Uri.parse("${UserUrls.termsAnsConditions}");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        termsAndcondition = resData['data'];
        print(resData);
        isLoading.value = false;
      } else {
        resData['status'];

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }
}
