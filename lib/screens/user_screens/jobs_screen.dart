import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/jobs_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class JobsScreen extends GetWidget<JobsScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(children: [
      appbar(isMenu: true, title: "Jobs", actions: [
        Container(
          margin: EdgeInsets.only(right: 20.w),
          padding: EdgeInsets.all(8.sp),
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
          child: Image.asset(
            ImageAssets.notificationicon,
            scale: 2,
          ),
        ),
      ]),
      Expanded(
        child: ListView(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 30.h),
          children: [
            Obx(
              () => Container(
                width: 1.0.sw,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        5,
                        (index) => GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = index;
                              },
                              child: Container(
                                width: 120.w,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10.w),
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                decoration: BoxDecoration(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? ColorUtils.red
                                            : ColorUtils.white,
                                    borderRadius: BorderRadius.circular(10.sp),
                                    border: Border.all(
                                        width: 1.w,
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? ColorUtils.red
                                            : ColorUtils.borderColor
                                                .withOpacity(0.5))),
                                child: Text(
                                  controller.names[index],
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: controller.selectedIndex.value ==
                                              index
                                          ? ColorUtils.white
                                          : ColorUtils.black),
                                ),
                              ),
                            )),
                  ),
                ),
              ),
            ),
            20.h.verticalSpace,
            Column(
              children: List.generate(3, (index) => activeJobCard()),
            )
          ],
        ),
      )
    ]));
  }
}
