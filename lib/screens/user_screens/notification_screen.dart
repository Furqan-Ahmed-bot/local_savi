import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/notification_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class NotificationScreen extends GetWidget<NotificationScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(children: [
      appbar(
        isMenu: false,
        title: "Notifications",
      ),
      Expanded(
        child: ListView(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 0.h),
          children: [
            26.h.verticalSpace,
            Container(
              margin: EdgeInsets.only(bottom: 12.sp),
              width: double.infinity,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    width: 1.w,
                    color: ColorUtils.borderColor.withOpacity(0.5),
                  )),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                    child: Image.asset(
                      ImageAssets.jobIcon,
                      scale: 2,
                    ),
                  ),
                  15.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 0.6.sw,
                            child: Text(
                              "Job Completed",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorUtils.black),
                            ),
                          ),
                          Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorUtils.borderColor),
                          ),
                        ],
                      ),
                      7.h.verticalSpace,
                      Text(
                        "William Roy has selected you for the job",
                        style: TextStyle(
                            fontSize: 14.sp, color: ColorUtils.textColor),
                      ),
                      5.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet",
                            style: TextStyle(
                              // fontFamily: Font.SemiBold,
                              color: ColorUtils.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          5.w.horizontalSpace,
                          Text(
                            "View Job Details",
                            style: TextStyle(
                                color: ColorUtils.red,
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorUtils.red,
                                decorationThickness: 2.h),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: List.generate(
                  7,
                  (index) => Container(
                        padding: EdgeInsets.all(15.sp),
                        margin: EdgeInsets.only(bottom: 12.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorUtils.white,
                            border: Border.all(
                                width: 1,
                                color:
                                    ColorUtils.borderColor.withOpacity(0.5))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 0.6.sw,
                                  child: Text(
                                    "Job Completed",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorUtils.black),
                                  ),
                                ),
                                Text(
                                  "Today",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: ColorUtils.borderColor),
                                ),
                              ],
                            ),
                            7.h.verticalSpace,
                            Text(
                              "Your cancellation request has been approved from admin.",
                              style: TextStyle(
                                  fontSize: 14.sp, color: ColorUtils.textColor),
                            ),
                          ],
                        ),
                      )),
            )
          ],
        ),
      )
    ]));
  }
}
