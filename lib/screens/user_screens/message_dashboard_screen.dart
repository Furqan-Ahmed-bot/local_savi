import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/message_dashboard_screen_controller.dart';
import 'package:local_saviors/resources/components/sockets/chats_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

import '../../utils/constant.dart';

class MessageDashboardScreen extends StatefulWidget {
  @override
  _MessageDashboardScreenState createState() => _MessageDashboardScreenState();
}

class _MessageDashboardScreenState extends State<MessageDashboardScreen> {
  // Initialize the controller
  final controller = Get.put(MessageDashboardScreenController());

  @override
  void initState() {
    socketController.sendOnlineAck();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return myBackGround(
      child: Column(
        children: [
          // appbar(isMenu: true, title: "Messages", actions: [
          //   GestureDetector(
          //     onTap: () {
          //       Get.toNamed(RouteName.notificationsScreenPath);
          //     },
          //     child: Container(
          //       margin: EdgeInsets.only(right: 20.w),
          //       padding: EdgeInsets.all(8.sp),
          //       height: 40.h,
          //       width: 40.w,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
          //       child: Image.asset(
          //         ImageAssets.notificationicon,
          //         scale: 2,
          //       ),
          //     ),
          //   ),
          // ]),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
              children: [
                Obx(
                  () => chatController.loading.value
                      ? Center(
                          child: spinkit,
                        )
                      : Column(
                          children: List.generate(
                            chatController.AllChats.length,
                            (index) => InkWell(
                              onTap: () {
                                if (chatController.AllChats[index]["user_one_id"] == hsController.userdata.userID) {}
                                Get.toNamed(RouteName.chatScreenPath, arguments: {"providerId": '', "jobId": '', "username": 'XYZ'});

                                Get.toNamed(RouteName.chatScreenPath);
                              },
                              child: chatController.AllChats[index]["user_one_id"] == hsController.userdata.userID
                                  ? messageUserCard(
                                      isVerified: true,
                                      date: chatController.AllChats[index]["chat_messages"][0]["createdAt"],
                                      image: chatController.AllChats[index]["user_one"]["user_details"]["profile_picture"],
                                      name:
                                          "${chatController.AllChats[index]["user_one"]["user_details"]["first_name"]} ${chatController.AllChats[index]["user_one"]["user_details"]["last_name"]}",
                                      desc: "",
                                    )
                                  : messageUserCard(
                                      isVerified: true,
                                      date: chatController.AllChats[index]["chat_messages"][0]["createdAt"],
                                      image: chatController.AllChats[index]["user_two"]["user_details"]["profile_picture"],
                                      name:
                                          "${chatController.AllChats[index]["user_two"]["user_details"]["first_name"]} ${chatController.AllChats[index]["user_two"]["user_details"]["last_name"]}",
                                      desc: "",
                                    ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
