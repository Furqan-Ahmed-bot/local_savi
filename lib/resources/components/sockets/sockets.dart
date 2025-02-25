// ignore_for_file: unnecessary_string_interpolations, prefer_if_null_operators

import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:local_saviors/utils/constant.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

import 'chats_controller.dart';

class SocketController extends GetxController {
  io.Socket? socket;
  final chatController = Get.put(GetChatController());
  // final myUserData = Get.find<UserProfileScreenController>();
  // final ChatController chatController = Get.find();
  TextEditingController messageController = TextEditingController();

  connectSocket() {
    socket = io.io("${UserUrls.socketUrl}", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'force new connection': true,
      'query': {
        'access_token': token.value,
      },
    });

    socket!.on('connect', (_) async {
      log('Connected to socket server');

      //await onSocketEvents();

      //addChatListeners();
    });

    socket!.on('connect_error', (error) {
      log('Connection error: $error');
    });

    socket!.on('error', (error) {
      log('Socket error: $error');
    });

    socket!.on('disconnect', (reason) {
      log('Socket disconnected: $reason');
    });
  }

  onSocketEvents() {
    socket?.on('authenticate_me', (message) {
      try {
        log('MESSAGE: $message');
      } catch (e, stackTrace) {
        log('Error handling MESSAGE event: $e');
        log('Stack trace: $stackTrace');
      }
    });

    socket?.on('error', (message) {
      try {
        log('READ_MESSAGE: $message');
      } catch (e, stackTrace) {
        log('Error handling READ_MESSAGE event: $e');
        log('Stack trace: $stackTrace');
      }
    });

    socket?.on('allChats-user_id-${hsController.userdata.userID != null ? hsController.userdata.userID : phController.performerdata.userId}',
        (message) {
      chatController.loading.value = true;
      try {
        log('privateMessage: $message');
        chatController.chatsdata(message);
        // chatController.allMessages.insert(0, message);
      } catch (e, stackTrace) {
        log('Error handling privateMessage event: $e');
        log('Stack trace: $stackTrace');
      }
    });

    socket?.on('privateMessage', (message) {
      try {
        log('privateMessage: $message');
        chatController.allMessages.insert(0, message);
      } catch (e, stackTrace) {
        log('Error handling privateMessage event: $e');
        log('Stack trace: $stackTrace');
      }
    });

    socket?.on('private_message_success', (message) {
      try {
        log('privateMessage: $message');
      } catch (e, stackTrace) {
        log('Error handling privateMessage event: $e');
        log('Stack trace: $stackTrace');
      }
    });

    socket?.on('error', (message) {
      try {
        log('READ_MESSAGE: $message');
      } catch (e, stackTrace) {
        log('Error handling READ_MESSAGE event: $e');
        log('Stack trace: $stackTrace');
      }
    });
  }

  isOnline() {
    socket?.emit("ONLINE_STATUS");
  }

  sendOnlineAck() {
    socket!.emit("get_chats", {
      "access_token": token.value,
    });
  }

  // addChatListeners() {
  //   try {
  //     chatController.loading.value = true;

  //     if (userRole == "THERAPIST") {
  //       log('Id  ${getUserData.therapistData.id}');
  //       socket?.on('allChats-user_id-${getUserData.therapistData.id}', (data) {
  //         chatController.chatsdata(data);
  //         log("New Message recieved $data");
  //       });
  //     } else {
  //       log('Id  ${getUserData.userdata.userDetails!.first.userId}');
  //       socket?.on('allChats-user_id-${getUserData.userdata.userDetails!.first.userId}', (data) {
  //         chatController.chatsdata(data);
  //         log("New Message recieved $data");
  //       });
  //     }
  //   } catch (e) {
  //     log(e.toString(), name: "Error in Chat Listener");
  //   }
  // }

  // joinChatRoom({dynamic id, dynamic chatId, dynamic jobId}) {
  //   if (chatId != null) {
  //     socket!.emit("join_private_chat", {
  //       "chat_id": chatId,
  //       "access_token": token.value,
  //     });
  //   } else {
  //     socket!.emit("join_private_chat", {
  //       "recipient_id": id,
  //       "job_id": jobId,
  //       "access_token": token.value,
  //     });
  //   }

  //   socket!.on('joined_private_chat_success', (data) {
  //     log("Joined Room $id $data");
  //   });
  // }

  joinChatRoom({dynamic id, dynamic chatId, dynamic jobId, Function? onSuccess}) async {
    if (chatId != null) {
      socket!.emit("join_private_chat", {
        "chat_id": chatId,
        "access_token": token.value,
      });
    } else {
      socket!.emit("join_private_chat", {
        "recipient_id": id,
        "job_id": jobId,
        "access_token": token.value,
      });
    }

    socket!.on('joined_private_chat_success', (data) {
      log("Joined Room $id $data");
      // If success callback is provided, call it
      if (onSuccess != null) {
        onSuccess(data);
      }
    });
  }

  leaveChatRoom() {
    socket!.off('joinedPrivateChatSuccess');
  }

  message({String? chatId, String? message, String? recipientId, String? jobId}) {
    Map<String, dynamic> map = {
      if (chatId != 0) "chatId": chatId,
      "message": message,
      "access_token": token.value,
      "recipient_id": recipientId,
      "job_id": jobId

      //  "createdAt": DateTime.now().toIso8601String(),
    };
    chatController.allMessages.insert(0, map);
    socket?.emit("private_chat_message", map);

    messageController.clear();
  }

  readMessage({required int chatId, required int chatEventId}) {
    socket?.emit("READ_MESSAGE", {
      "chatId": chatId,
      "chatEventId": chatEventId,
    });
  }

  disconnectSocket() {
    socket?.disconnect();
    log('Socket disconnected cleanly');
  }
}
