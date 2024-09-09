import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/best_performer_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';

class BestPerformerScreen extends GetWidget<BestPerformerScreenController> {
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
            child: ListView(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
          children: List.generate(
              controller.listOfBestPerformers.length,
              (index) => bestPerformerCard(
                  isVerified: controller.listOfBestPerformers[index]
                      ['isVerified'],
                  image: controller.listOfBestPerformers[index]['image'],
                  name: controller.listOfBestPerformers[index]['name'],
                  rating: controller.listOfBestPerformers[index]['rating'])),
        ))
      ],
    ));
  }
}
