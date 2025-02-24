// ignore_for_file: unused_element

import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as http;

import '../../../utils/api_services/app_urls.dart';
import '../../../utils/constant.dart';

class GetChatController extends GetxController {
  RxBool loading = false.obs;
  RxBool isMessagesLoading = false.obs;
  RxList AllChats = [].obs;
  RxList allMessages = [].obs;
  var avgRatings;
  Map jobDetails = {};
  bool isJobAssigned = false;
  chatsdata(data) {
    AllChats.value = data;

    if (data.length > 0) {
      loading.value = false;
    } else if (data.isEmpty) {
      loading.value = false;
    }

    print('Message ${data}');
  }

  getSingleChat(chatId) async {
    try {
      isMessagesLoading.value = true;
      var headers = {'Authorization': token.value};

      final uri = Uri.parse("${UserUrls.getSingleChat}/${chatId}");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        isMessagesLoading.value = false;
        jobDetails = resData['data']['jobs'];
        isJobAssigned = resData['data']['job_already_assigned'];
        allMessages.value = resData['data']['chat_messages'];
        avgRatings = resData['data']['review']['average_ratings'];
      } else {
        isMessagesLoading.value = false;
        resData['status'];
        update();
      }
    } catch (e) {
      isMessagesLoading.value = false;
      update();
    }
  }
  // Future<void> getChat({reciverid, chatid}) async {
  //   try {
  //     isMessagesLoading.value = true;
  //     var resData = await repo.getAllChats(reciverid, chatid);
  //     if (resData['status']['success'] == true) {
  //       allMessages.value = resData["data"];
  //     } else {
  //       Get.snackbar('Message', resData['message']);
  //     }
  //   } catch (e) {
  //     Get.snackbar('Message', e.toString());
  //   } finally {
  //     isMessagesLoading.value = false;
  //   }
  // }
}
