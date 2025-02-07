// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:url_launcher/url_launcher.dart';

import '../../resources/components/web_view/launch_url.dart';
import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';

class WalletController extends GetxController {
  RxInt currentIndex = 0.obs;
  String? url;

  updateIndex(index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    print('wallet controller ');
    super.onInit();
  }

  getStripeUrl() async {
    try {
      var headers = {'Authorization': token.value};

      final uri = Uri.parse("${UserUrls.connectStripe}");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        url = resData['data'];
        launchUrl(Uri.parse(resData['data'])).asStream();
      } else {
        resData['status'];
        update();
      }
    } catch (e) {
      update();
    }
  }
}
