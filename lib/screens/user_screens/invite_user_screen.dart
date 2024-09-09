import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/invite_user_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';

class InviteUserScreen extends GetWidget<InviteUserScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        appbar(
          isMenu: false,
          title: "Invite User",
        ),
        Expanded(
            child: ListView(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                children: [
              Column(
                children: List.generate(
                    controller.listOfInviteUsers.length,
                    (index) => inviteUserCard(
                        isVerified: controller.listOfInviteUsers[index]
                            ['isVerified'],
                        image: controller.listOfInviteUsers[index]['image'],
                        name: controller.listOfInviteUsers[index]['name'],
                        rating: controller.listOfInviteUsers[index]['rating'])),
              ),
            ]))
      ],
    ));
  }
}
