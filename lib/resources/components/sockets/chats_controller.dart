// ignore_for_file: unused_element, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:http_parser/http_parser.dart' as parser;

import '../../../utils/api_services/app_urls.dart';
import '../../../utils/constant.dart';
import '../imagepicker_component.dart';

class GetChatController extends GetxController {
  final imagePickerController = Get.put(ImagePickerController());

  RxBool loading = false.obs;
  RxBool isMessagesLoading = false.obs;
  RxList AllChats = [].obs;
  RxList allMessages = [].obs;
  var avgRatings;
  Map jobDetails = {};
  bool isJobAssigned = false;
  bool chatAllowed = true;
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
        chatAllowed = resData['data']['chat_allowed'];
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

  sendMedia({context, List? attachments, var chatId, var recipient_id}) async {
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
      var headers = {'Authorization': token.value};

      var request = http.MultipartRequest('POST', Uri.parse(UserUrls.sendMedia));

      if (attachments != null) {
        for (var i = 0; i < attachments.length; i++) {
          var multipartFile = await http.MultipartFile.fromPath(
            'attachment',
            attachments[i].path,
            filename: attachments[i].path.split('/').last,
            contentType: parser.MediaType("image", "${attachments[i].path.split('.').last}"),
          );
          request.files.add(multipartFile);
        }
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        var urls = responseData['data']['urls'];
        for (var i = 0; i < urls.length; i++) {
          socketController.message(chatId: chatId, attachment: urls[i]['path'], recipientId: recipient_id);
        }

        Get.close(2);
        imagePickerController.selectedImages.clear();
      } else {
        responseData['message'];
        print(response.toString());
        Get.back();
      }
    } catch (e) {
      Get.back();

      debugPrint("==> error: ${e.toString()}");
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
