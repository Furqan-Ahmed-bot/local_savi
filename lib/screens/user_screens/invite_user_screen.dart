// ignore_for_file: prefer_interpolation_to_compose_strings, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
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
          Obx(
            () => Expanded(
                child: controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      )
                    : ListView(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                        children: [
                            Column(
                              children: List.generate(
                                  controller.listOfUserRequests.length,
                                  (index){
                                    final user = controller.listOfUserRequests[index];
                                final performerId = user['performer_id'];
                                final isInvited = controller.isUserInvited(performerId);

                                     return InkWell(
                                        onTap: () {
                                          if (!isInvited) {
                                            UserServices.instance
                                                .sentRehireRequest(
                                                    jobId: controller.jobId,
                                                    performer_id: controller
                                                            .listOfUserRequests[
                                                        index]['performer_id'],
                                                    context: context);
                                          }
                                        },
                                        child: inviteUserCard(
                                            isInvited: isInvited,
                                            isVerified: true,
                                            image: controller
                                                    .listOfUserRequests[index]
                                                ['profile_picture'],
                                            name: controller.listOfUserRequests[
                                                    index]['first_name'] +
                                                " " +
                                                controller.listOfUserRequests[
                                                    index]['last_name'],
                                            rating:
                                                "${controller.listOfUserRequests[index]['average_ratings']}"),
                                      );
                                  }),
                            ),
                          ])),
          )
        ],
      ));
    });
  }
}
