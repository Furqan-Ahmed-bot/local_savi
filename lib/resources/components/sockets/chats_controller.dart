import 'dart:convert';

import 'package:get/get.dart';

class GetChatController extends GetxController {
  RxBool loading = false.obs;
  RxBool isMessagesLoading = false.obs;
  RxList AllChats = [].obs;
  RxList allMessages = [].obs;
  chatsdata(data) {
    AllChats.value = data;

    if (data.length > 0) {
      loading.value = false;
    } else if (data.isEmpty) {
      loading.value = false;
    }

    print('Message ${data}');
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
