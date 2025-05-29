import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';

class AboutController extends GetxController {
  RxBool isLoading = false.obs;
  Map aboutapp = {}.obs;

  @override
  void onInit() {
    aboutApp();
    super.onInit();
  }

  aboutApp() async {
    try {
      var headers = {'Authorization': token.value};

      isLoading.value = true;
      final uri = Uri.parse("${UserUrls.aboutApp}");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        aboutapp = resData['data'];
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
