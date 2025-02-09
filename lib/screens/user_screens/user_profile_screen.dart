// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/user_profile_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class UserProfileScreen extends GetWidget<UserProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(
              left: 20.w, right: 20.w, top: 46.h, bottom: 110.h),
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: spinkit,
                    )
                  : GetBuilder<UserProfileScreenController>(
                      builder: (controller) {
                      return Column(
                        children: [
                          controller.userdata.userDetails!.profilePicture ==
                                  null
                              ? Image.asset(
                                  ImageAssets.userProfileImg,
                                  scale: 2,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: ColorUtils.red, width: 4),
                                  ),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(controller
                                            .userdata
                                            .userDetails!
                                            .profilePicture ??
                                        ""),
                                  ),
                                ),
                          16.h.verticalSpace,
                          Text(
                            "${controller.userdata.userDetails!.firstName.toString().capitalizeFirst ?? ""} ${controller.userdata.userDetails!.lastName.toString().capitalizeFirst ?? ""}",
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.bold),
                          ),
                          16.h.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Divider(
                              color: ColorUtils.black.withOpacity(0.3),
                            ),
                          ),
                          16.h.verticalSpace,
                          Container(
                            padding: EdgeInsets.all(20.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.w),
                                color: ColorUtils.white,
                                border: Border.all(
                                    width: 1.w, color: ColorUtils.borderColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: List.generate(
                                    controller.userData.length,
                                    (index) => Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // width: 0.3.sw,
                                              margin:
                                                  EdgeInsets.only(right: 20.w),
                                              child: Text(
                                                controller.userData[index]
                                                    ['title'],
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                controller.userData[index]
                                                    ["value"],
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        16.h.verticalSpace,
                                        Divider(
                                          color: ColorUtils.borderColor
                                              .withOpacity(0.5),
                                        ),
                                        16.h.verticalSpace,
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                10.h.verticalSpace,
                                Image.asset(
                                  ImageAssets.mapimg,
                                  // scale: 2,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
            ),
          ],
        ))
      ],
    ));
  }
}
