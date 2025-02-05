import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/invite_user_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class InviteUserScreen extends GetWidget<InviteUserScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteUserScreenController>(builder: (controller) {
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
                      controller.listOfUserRequests.length,
                      (index) => InkWell(
                            onTap: () {
                              if (!controller.listOfUserRequests[index]
                                  ['isInvited']) {
                                UserServices.instance
                                    .sentInviteToPerformer(
                                        context: context,
                                        jobId:
                                            controller.listOfUserRequests[index]
                                                ['job_id'],
                                        performerId:
                                            controller.listOfUserRequests[index]
                                                ['performer_id'])
                                    .then((value) {
                                  controller.listOfUserRequests[index]
                                      ['isInvited'] = true;
                                  controller.update();
                                });
                              }
                            },
                            child: inviteUserCard(
                                isInvited: controller.listOfUserRequests[index]
                                    ['isInvited'],
                                isVerified: true,
                                image: controller.listOfUserRequests[index]
                                        ['performer']['user_details']
                                    ['profile_picture'],
                                name: controller.listOfUserRequests[index]
                                            ['performer']['user_details']
                                        ['first_name'] +
                                    " " +
                                    controller.listOfUserRequests[index]
                                            ['performer']['user_details']
                                        ['last_name'],
                                rating: "(4.5)"),
                          )),
                ),
              ]))
        ],
      ));
    });
  }
}
