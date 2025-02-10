// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/best_performer_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/constant.dart';

import '../../controllers/user_controllers/home_screen_controller.dart';

class BestPerformerScreen extends GetWidget<BestPerformerScreenController> {
  // final homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        appbar(
          isMenu: false,
          title: "Best Performers",
        ),
        Expanded(
            child: Obx(
          () => hsController.issecondaryLoading.value
              ? Center(
                  child: spinkit,
                )
              : ListView(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                  children: List.generate(
                      hsController.bestPerformers.length,
                      (index) => bestPerformerCard(
                          id: hsController.bestPerformers[index]['id'],
                          isVerified: true,
                          image: hsController.bestPerformers[index]['profile_picture'],
                          name: hsController.bestPerformers[index]['first_name'],
                          rating: hsController.bestPerformers[index]['average_ratings'].toString())),
                ),
        ))
      ],
    ));
  }
}
