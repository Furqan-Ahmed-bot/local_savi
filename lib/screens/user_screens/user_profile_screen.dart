import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/user_profile_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class UserProfileScreen extends GetWidget<UserProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        // appbar(isMenu: false, title: "My Profile", actions: [
        //   GestureDetector(
        //     onTap: () {
        //       // Get.toNamed(RouteName.notificationsScreenPath);
        //     },
        //     child: Container(
        //       margin: EdgeInsets.only(right: 20.w),
        //       padding: EdgeInsets.all(8.sp),
        //       height: 40.h,
        //       width: 40.w,
        //       decoration: BoxDecoration(
        //           shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
        //       child: Image.asset(
        //         ImageAssets.editIcon,
        //         color: ColorUtils.red,
        //         scale: 2,
        //       ),
        //     ),
        //   ),
        //   GestureDetector(
        //     onTap: () {
        //       // Get.toNamed(RouteName.notificationsScreenPath);
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
        //         color: ColorUtils.red,
        //         scale: 2,
        //       ),
        //     ),
        //   ),
        // ]),

        Expanded(
            child: ListView(
          padding: EdgeInsets.only(
              left: 20.w, right: 20.w, top: 46.h, bottom: 110.h),
          children: [
            Column(
              children: [
                Image.asset(
                  ImageAssets.userProfileImg,
                  scale: 2,
                ),
                16.h.verticalSpace,
                Text(
                  "John Smith",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
                          controller.dummyData.length,
                          (index) => Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 0.3.sw,
                                    margin: EdgeInsets.only(right: 20.w),
                                    child: Text(
                                      controller.dummyData[index]['title'],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller.dummyData[index]["value"],
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
                                color: ColorUtils.borderColor.withOpacity(0.5),
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
            ),
          ],
        ))
      ],
    ));
  }
}
