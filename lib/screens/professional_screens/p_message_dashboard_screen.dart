import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:local_saviors/controllers/professional_controllers/p_message_dashboard_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PMessageDashboardScreen extends GetWidget<PMessageDashboardController> {
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
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
                children: [
              Column(
                children: List.generate(
                    controller.listOfMessageUsers.length,
                    (index) => InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.pchatScreenPath);
                          },
                          child: messageUserCard(
                              isVerified: controller.listOfMessageUsers[index]
                                  ['isVerified'],
                              date: controller.listOfMessageUsers[index]
                                  ['date'],
                              image: controller.listOfMessageUsers[index]
                                  ['image'],
                              name: controller.listOfMessageUsers[index]
                                  ['name'],
                              desc: controller.listOfMessageUsers[index]
                                  ['desc']),
                        )),
              ),
            ]))
      ],
    ));
  }
}
