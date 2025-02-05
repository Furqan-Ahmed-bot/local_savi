import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/user_request_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class UserRequestScreen extends GetWidget<UserRequestScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        appbar(
          isMenu: false,
          title: "User Request",
        ),
        GetBuilder<UserRequestScreenController>(builder: (controller) {
          return Expanded(
              child: ListView(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                  children: [
                Row(
                  children: [
                    Image.asset(
                      ImageAssets.usersIcon,
                      scale: 2,
                    ),
                    10.w.horizontalSpace,
                    Text(
                      "Total Requests",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    10.w.horizontalSpace,
                    Text(
                      "(${controller.listOfUserRequests.length})",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                      controller.listOfUserRequests.length,
                      (index) => userRequestCard(
                          isVerified: true,
                          id: controller.listOfUserRequests[index]
                              ['performer_id'],
                          image: controller.listOfUserRequests[index]
                              ['performer']['user_details']['profile_picture'],
                          name: controller.listOfUserRequests[index]
                                  ['performer']['user_details']['first_name'] +
                              " " +
                              controller.listOfUserRequests[index]['performer']
                                  ['user_details']['last_name'],
                          rating: "(4.5)")),
                ),
              ]));
        })
      ],
    ));
  }
}
