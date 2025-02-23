import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_message_dashboard_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

import '../../utils/constant.dart';

class PMessageDashboardScreen extends StatefulWidget {
  @override
  _PMessageDashboardScreenState createState() => _PMessageDashboardScreenState();
}

class _PMessageDashboardScreenState extends State<PMessageDashboardScreen> {
  final controller = Get.put(PMessageDashboardController());

  @override
  void initState() {
    socketController.sendOnlineAck();
  }

  @override
  Widget build(BuildContext context) {
    return myBackGround(
      child: Column(
        children: [
          // Uncomment this if you want to use the app bar
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
                                  if (chatController.AllChats[index]["user_two_id"] == phController.performerdata.userId) {}
                                  Get.toNamed(RouteName.chatScreenPath, arguments: {
                                    "providerId": '${chatController.AllChats[index]['user_one_id']}',
                                    "jobId": '${chatController.AllChats[index]['job_id']}',
                                    "username":
                                        '${chatController.AllChats[index]["user_one"]["user_details"]["first_name"]} ${chatController.AllChats[index]["user_two"]["user_details"]["last_name"]}',
                                    'profile_picture': chatController.AllChats[index]["user_one"]["user_details"]["profile_picture"],
                                    'chat_id': "${chatController.AllChats[index]['id']}",
                                  });

                                  // Get.to(() => ChatScreen(
                                  //       jobId: chatController.AllChats[index]['job_id'],
                                  //       recipientId: chatController.AllChats[index]['user_two_id'],
                                  //       chatId: chatController.AllChats[index]['id'],
                                  //     ));

                                  //Get.toNamed(RouteName.chatScreenPath);
                                },
                                child: chatController.AllChats[index]["user_one_id"] == phController.performerdata.userId
                                    ? messageUserCard(
                                        isVerified: true,
                                        date: chatController.AllChats[index]["chat_messages"][0]["createdAt"],
                                        image: chatController.AllChats[index]["user_two"]["user_details"]["profile_picture"],
                                        name:
                                            "${chatController.AllChats[index]["user_two"]["user_details"]["first_name"]} ${chatController.AllChats[index]["user_two"]["user_details"]["last_name"]}",
                                        desc: "${chatController.AllChats[0]['chat_messages'][0]['message']}",
                                      )
                                    : messageUserCard(
                                        isVerified: true,
                                        date: DateTime.now(),
                                        image: chatController.AllChats[index]["user_one"]["user_details"]["profile_picture"],
                                        name:
                                            "${chatController.AllChats[index]["user_one"]["user_details"]["first_name"]} ${chatController.AllChats[index]["user_one"]["user_details"]["last_name"]}",
                                        desc: "${chatController.AllChats[0]['chat_messages'][0]['message']}",
                                      )),
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
