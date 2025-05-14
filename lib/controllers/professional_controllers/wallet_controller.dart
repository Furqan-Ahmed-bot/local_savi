// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:local_saviors/screens/professional_screens/stripe_completion.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/api_services/app_urls.dart';
import '../../utils/api_services/user_services.dart';
import '../../utils/constant.dart';
import '../../utils/routes/routes.dart';
import 'payment_method_controller.dart';

class WalletController extends GetxController {
  final paymentController = Get.put(PaymentMethodController());
  RxInt currentIndex = 0.obs;
  String? url;
  RxBool isLoading = false.obs;
  var message;
  var sUrl;

  updateIndex(index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    UserServices.instance.getProfileService(isAutoLogin: false);
    paymentController.getAccountBalance();
    paymentController.getAllTranscations('CREDIT');

    print('wallet controller ');
    super.onInit();
  }

  Future getStripeUrl() async {
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

  Future accountRestriction() async {
    isLoading.value = true;
    try {
      var headers = {'Authorization': token.value};

      final uri = Uri.parse("${UserUrls.getAccountRestriction}");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        isLoading.value = false;
        // url = resData['data'];
        // launchUrl(Uri.parse(resData['data'])).asStream();
        if (resData['data']['is_fresh'] == true) {
          Get.close(1);
          Get.toNamed(RouteName.walletScreen);
        } else if (resData['data']['is_missing'] == true) {
          message = resData['data']['message'];
          sUrl = resData['data']['url'];
          Get.close(1);

          Get.to(() => AccountCorrectionScreen());
        } else {
          UserServices.instance.getProfileService(isAutoLogin: false).then((value) => Get.toNamed(RouteName.walletScreen));
        }
      } else {
        isLoading.value = false;
        resData['status'];
        update();
      }
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }
}
