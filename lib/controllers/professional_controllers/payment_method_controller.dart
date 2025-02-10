// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:local_saviors/utils/color_utils.dart';

import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';
import '../../utils/images/image_assets.dart';

class PaymentMethodController extends GetxController {
  RxInt stepIndex = 0.obs;
  RxInt groupValue = 0.obs;
  RxInt cardvalue = 0.obs;
  RxInt workingHour = 0.obs;
  RxInt fixedAmoount = 0.obs;
  RxInt totalAmount = 0.obs;
  RxBool isAm = false.obs;
  RxList allBanks = [].obs;
  RxInt selectedBankIndex = (-1).obs; // Holds the index of the selected bank
  RxString bankName = "".obs;
  RxString routingNumber = "".obs;
  final amountController = TextEditingController();
  var bankId;
  var AccountNumberController = TextEditingController();
  var RoutingNumberController = TextEditingController();
  List allTranscations = [];

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllBanks();

    // TODO: implement onInit
    super.onInit();
  }

  List ListOfText = [
    // {
    //   "title": "Wallet",
    //   "image": ImageAssets.drawerWallet,
    // },
    {
      "title": "Google Pay",
      "image": ImageAssets.googlePay,
    },
    {
      "title": "Apple Pay",
      "image": ImageAssets.applePay,
    },
    {
      "title": "PayPal",
      "image": ImageAssets.paypal,
    },
    {
      "title": "**** **** **** 6592",
      "image": ImageAssets.masterCard,
    },
  ];

  void selectedBank(int index, bankDetails) {
    selectedBankIndex.value = index;
    bankName.value = bankDetails['bank_name'];
    routingNumber.value = bankDetails['routing_number'];
    bankId = bankDetails['id'];
  }

  void validate(BuildContext context) {
    if (AccountNumberController.text.trim().toString().isEmpty) {
      Get.snackbar('Alert', "Field Accoount Number can not be empty");
      return;
    } else if (RoutingNumberController.text.trim().toString().isEmpty) {
      Get.snackbar('Alert', "Field Accoount Number can not be empty");
      return;
    } else {
      addBank(context);

      //  createExternalBankAccounts(context);
    }
  }

  addBank(context) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {'Content-Type': 'application/json', 'Authorization': token.value};
      var request = http.Request('POST', Uri.parse("${UserUrls.addAccount}"));
      request.body = json.encode({"routing_number": RoutingNumberController.text, "account_number": AccountNumberController.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        // addbank(responseData['data']);
        Get.close(3);
      } else {
        responseData['message'];
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }

  getAllBanks() async {
    try {
      var headers = {'Authorization': token.value};

      isLoading.value = true;
      final uri = Uri.parse(UserUrls.getBanks);

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        isLoading.value = false;
        allBanks.value = resData['data']['data'];
      } else {
        resData['status'];

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  getAccountBalance() async {
    try {
      var headers = {'Authorization': token.value};

      isLoading.value = true;
      final uri = Uri.parse(UserUrls.getPersonalBalance);

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        // isLoading.value = false;
        totalAmount.value = resData['data']['amount'];
      } else {
        resData['status'];

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  getAllTranscations(type) async {
    try {
      isLoading.value = true;
      var headers = {'Authorization': token.value};

      final uri = Uri.parse("${UserUrls.getAllTranscations}?type=$type");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        isLoading.value = false;
        allTranscations = resData['data'];
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

  transferAmount(context) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {'Content-Type': 'application/json', 'Authorization': token.value};
      var request = http.Request('POST', Uri.parse("${UserUrls.transferAmount}"));
      request.body = json.encode({"amount": amountController.text, "destination": bankId});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        // addbank(responseData['data']);
        Get.close(1);
      } else {
        responseData['message'];
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }

  addbank(data) {
    allBanks.add(data);
  }
}
