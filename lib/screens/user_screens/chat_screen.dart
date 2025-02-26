// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/chat_screen_controller.dart';
import 'package:local_saviors/resources/components/sockets/sockets.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = Get.put(ChatScreenController());
  final socketController = Get.put(SocketController());

  @override
  void initState() {
    super.initState();
    chatController.isMessagesLoading.value = true;
    // Join the chat room and pass the callback to handle the success response
    socketController.joinChatRoom(
        jobId: controller.jobId,
        chatId: controller.chatId,
        id: controller.performerId,
        onSuccess: (data) {
          // Get the chatId once the socket response is successful
          if (data != null && data['chat_id'] != null) {
            data['chat_id']; // Update the chatId with the response
            // Now, call the API to get the single chat
            chatController.getSingleChat(data['chat_id']);
          }
        });
  }

  @override
  void dispose() {
    chatController.allMessages.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      floatingActionButton: (!isKeyboardVisible)
          ? Container(
              decoration: BoxDecoration(
                color: ColorUtils.primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.showUserDetail.value
                      ? Container(
                          padding: EdgeInsets.all(15.sp),
                          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                          width: 1.0.sw,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                width: 1.w,
                                color: ColorUtils.borderColor.withOpacity(0.5),
                              ),
                              color: ColorUtils.white),
                          child: Obx(
                            () => chatController.isMessagesLoading.value
                                ? Center(
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(RouteName.bestPerformerDetailScreenPath, arguments: {
                                            "title": "Employee Profile",
                                            "showChat": true,
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: ClipOval(
                                                    child: Image.network(
                                                      loadingBuilder: (context, child, loadingProgress) {
                                                        if (loadingProgress == null) return child;
                                                        return const Center(
                                                          child: CircularProgressIndicator(),
                                                        );
                                                      },
                                                      errorBuilder: (context, error, stackTrace) {
                                                        return const Center(
                                                          child: CircularProgressIndicator(),
                                                        );
                                                      },
                                                      fit: BoxFit.cover,
                                                      controller.profile_picture,
                                                      scale: 2,
                                                    ),
                                                  ),
                                                ),
                                                // ClipRRect(
                                                //   borderRadius: BorderRadius.circular(100.r),
                                                //   child: Container(
                                                //     decoration: BoxDecoration(
                                                //         borderRadius: BorderRadius.circular(100.r),
                                                //         border: Border.all(width: 1.w, color: ColorUtils.borderColor.withOpacity(0.5))),
                                                //     child: Image.asset(
                                                //       ImageAssets.oliverImg,
                                                //       scale: 2,
                                                //     ),
                                                //   ),
                                                // ),
                                                // Positioned(
                                                //     right: 0,
                                                //     child: SizedBox(
                                                //       height: 40,
                                                //       width: 40,
                                                //       child: ClipRect(
                                                //         child: Image.network(
                                                //           '${controller.profile_picture}',
                                                //           scale: 2,
                                                //         ),
                                                //       ),
                                                //     ))
                                              ],
                                            ),
                                            20.w.horizontalSpace,
                                            Obx(
                                              () => chatController.isMessagesLoading.value
                                                  ? Center(
                                                      child: Container(
                                                        color: Colors.transparent,
                                                      ),
                                                    )
                                                  : Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "${controller.username}",
                                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                                                        ),
                                                        5.h.verticalSpace,
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Image.asset(
                                                              ImageAssets.starIcon,
                                                              scale: 2,
                                                            ),
                                                            7.w.horizontalSpace,
                                                            Text(
                                                              "(${chatController.avgRatings})",
                                                              style: TextStyle(),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Obx(
                                        () => Row(
                                          children: [
                                            controller.isPendingJob.value
                                                ? Row(
                                                    children: [
                                                      Image.asset(
                                                        ImageAssets.pendingIcon,
                                                        scale: 2,
                                                      ),
                                                      10.horizontalSpace,
                                                      Text(
                                                        "Pending your job...",
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      if (!chatController.isJobAssigned) {
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                backgroundColor: ColorUtils.dialogeBGColor,
                                                                content: SizedBox(
                                                                  width: 1.0.sw,
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      20.h.verticalSpace,
                                                                      Image.asset(
                                                                        ImageAssets.jobBigIcon,
                                                                        scale: 2,
                                                                      ),
                                                                      20.h.verticalSpace,
                                                                      Text(
                                                                        "Select For Job!",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: ColorUtils.black,
                                                                          fontSize: 22.sp,
                                                                        ),
                                                                      ),
                                                                      24.h.verticalSpace,
                                                                      Text(
                                                                        "Are you sure you want select William Roy for your job?",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: ColorUtils.black,
                                                                          fontSize: 14.sp,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  Container(
                                                                    width: 1.0.sw,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child: GestureDetector(
                                                                            onTap: () {
                                                                              Get.back();
                                                                              // controller.isPendingJob.value = true;

                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                      backgroundColor: ColorUtils.dialogeBGColor,
                                                                                      content: SizedBox(
                                                                                        width: 1.0.sw,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            20.h.verticalSpace,
                                                                                            Image.asset(
                                                                                              ImageAssets.jobBigIcon,
                                                                                              scale: 2,
                                                                                            ),
                                                                                            20.h.verticalSpace,
                                                                                            Text(
                                                                                              "Decided Amount",
                                                                                              textAlign: TextAlign.center,
                                                                                              style: TextStyle(
                                                                                                color: ColorUtils.black,
                                                                                                fontSize: 22.sp,
                                                                                              ),
                                                                                            ),
                                                                                            24.h.verticalSpace,
                                                                                            EditText(
                                                                                              context: context,
                                                                                              bordercolor: Colors.amberAccent,
                                                                                              controller: controller.decidedAmountController,
                                                                                            )
                                                                                            // Text(
                                                                                            //   "Are you sure you want select William Roy for your job?",
                                                                                            //   textAlign: TextAlign.center,
                                                                                            //   style: TextStyle(
                                                                                            //     color: ColorUtils.black,
                                                                                            //     fontSize: 14.sp,
                                                                                            //   ),
                                                                                            // ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      actions: [
                                                                                        Container(
                                                                                          width: 1.0.sw,
                                                                                          child: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    // Get.back();
                                                                                                    controller.assignJob(context, controller.jobId,
                                                                                                        controller.performerId);
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    alignment: Alignment.center,
                                                                                                    padding: EdgeInsets.symmetric(vertical: 15.h),
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(10.r),
                                                                                                      color: ColorUtils.red,
                                                                                                    ),
                                                                                                    child: Text(
                                                                                                      "Confirm",
                                                                                                      style: TextStyle(color: ColorUtils.white),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                    );
                                                                                  });
                                                                            },
                                                                            child: Container(
                                                                              alignment: Alignment.center,
                                                                              padding: EdgeInsets.symmetric(vertical: 15.h),
                                                                              decoration: BoxDecoration(
                                                                                  color: ColorUtils.white,
                                                                                  borderRadius: BorderRadius.circular(10.r),
                                                                                  border: Border.all(width: 1.w, color: ColorUtils.borderColor)),
                                                                              child: const Text("Yes, Select"),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        20.w.horizontalSpace,
                                                                        Expanded(
                                                                          child: GestureDetector(
                                                                            onTap: () {
                                                                              Get.back();
                                                                            },
                                                                            child: Container(
                                                                              alignment: Alignment.center,
                                                                              padding: EdgeInsets.symmetric(vertical: 15.h),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.r),
                                                                                color: ColorUtils.red,
                                                                              ),
                                                                              child: Text(
                                                                                "No",
                                                                                style: TextStyle(color: ColorUtils.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              );
                                                            });
                                                      }
                                                    },
                                                    child: Container(
                                                      // width: 120.w,
                                                      alignment: Alignment.center,
                                                      // margin: EdgeInsets.only(right: 10.w),
                                                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),

                                                      decoration: BoxDecoration(
                                                          color: ColorUtils.red,
                                                          borderRadius: BorderRadius.circular(10.sp),
                                                          border: Border.all(width: 1.w, color: ColorUtils.red.withOpacity(0.5))),
                                                      child: Text(
                                                        chatController.isJobAssigned ? 'Selected For Job' : "Select for job",
                                                        style: TextStyle(fontSize: 14.sp, color: ColorUtils.white),
                                                      ),
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        )
                      : SizedBox.shrink(),
                  controller.showUserDetail.value ? 20.verticalSpace : 0.verticalSpace,
                  controller.showUserDetail.value
                      ? Obx(
                          () => chatController.isMessagesLoading.value
                              ? Center(
                                  child: spinkit,
                                )
                              : controller.chatId == null
                                  ? Container()
                                  : Container(
                                      padding: EdgeInsets.all(15.sp),
                                      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                                      width: 1.0.sw,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          border: Border.all(
                                            width: 1.w,
                                            color: ColorUtils.borderColor.withOpacity(0.5),
                                          ),
                                          color: ColorUtils.white),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Job Details",
                                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          5.verticalSpace,
                                          Text(
                                            "${chatController.jobDetails['title']}",
                                            style: TextStyle(fontSize: 16.sp, color: ColorUtils.textColor),
                                          ),
                                          5.verticalSpace,
                                          Text(
                                            "${chatController.jobDetails['description']}",
                                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: ColorUtils.textColor),
                                          ),
                                        ],
                                      ),
                                    ),
                        )
                      : SizedBox.shrink(),
                  controller.showUserDetail.value ? 20.verticalSpace : 20.verticalSpace,
                ],
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      // bottomNavigationBar: Container(
      //     color: ColorUtils.white,
      //     padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      //     height: 100.h,
      //     child: EditText(
      //         context: context,
      //         controller: socketController.messageController,
      //         needSuffix: true,
      //         suffixWidget: Container(
      //           child: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               Image.asset(
      //                 ImageAssets.attachIcon,
      //                 scale: 3,
      //               ),
      //               10.horizontalSpace,
      //               InkWell(
      //                 onTap: () {
      //                   if (socketController.messageController.text.isNotEmpty) {
      //                     socketController.message(
      //                         jobId: controller.jobId, message: socketController.messageController.text, recipientId: controller.performerId);
      //                     print('Hello');
      //                   }
      //                 },
      //                 child: Container(
      //                   margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
      //                   padding: EdgeInsets.all(5.sp),
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(5.r),
      //                     color: ColorUtils.red,
      //                   ),
      //                   child: Image.asset(
      //                     ImageAssets.sendIcon,
      //                     scale: 2,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         bordercolor: ColorUtils.borderColor,
      //         hintText: "Type your message here...")

      //     // AuthTextField(
      //     //     borderWidth: 1.0.w,
      //     //     borderColor: ColorUtils.borderColor,
      //     //     suffixIcon: ImageAssets.sendIcon,
      //     //     hint: "Type your reviews"),
      //     ),
      body: GetBuilder<ChatScreenController>(builder: (controller) {
        return myBackGround(
            child: Column(
          children: [
            appbar(
              isMenu: false,
              title: '${controller.username}',
            ),
            Obx(
              () => chatController.isMessagesLoading.value
                  ? Center(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: chatController.allMessages.length,
                          itemBuilder: (context, index) {
                            return chatController.allMessages[index]['recipient_id'] != controller.performerId
                                ? getReceiverView(
                                    datetime: chatController.allMessages[index]['createdAt'],
                                    image: controller.profile_picture,
                                    username: controller.username,
                                    clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
                                    context: context,
                                    text: "${chatController.allMessages[index]['message']}")
                                : getSenderView(
                                    clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
                                    context: context,
                                    text: "${chatController.allMessages[index]['message']}");
                          }),
                    ),
            ),
            Container(
                color: ColorUtils.white,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                height: 100.h,
                child: EditText(
                    context: context,
                    controller: socketController.messageController,
                    needSuffix: true,
                    suffixWidget: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            ImageAssets.attachIcon,
                            scale: 3,
                          ),
                          10.horizontalSpace,
                          InkWell(
                            onTap: () {
                              if (socketController.messageController.text.isNotEmpty) {
                                socketController.message(
                                    jobId: controller.jobId, message: socketController.messageController.text, recipientId: controller.performerId);
                                print('Hello');
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
                              padding: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: ColorUtils.red,
                              ),
                              child: Image.asset(
                                ImageAssets.sendIcon,
                                scale: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    bordercolor: ColorUtils.borderColor,
                    hintText: "Type your message here...")

                // AuthTextField(
                //     borderWidth: 1.0.w,
                //     borderColor: ColorUtils.borderColor,
                //     suffixIcon: ImageAssets.sendIcon,
                //     hint: "Type your reviews"),
                ),
          ],
        ));
      }),
    );
  }
}
