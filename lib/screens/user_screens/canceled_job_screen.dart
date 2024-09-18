import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/cancelled_job_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class CancelledJobScreen extends GetWidget<CancelledJobScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        appbar(
          isMenu: false,
          title: "Job Details",
        ),
        Expanded(
            child: ListView(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
          children: [
            20.h.verticalSpace,
            Text(
              "Job Cancel Details",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            28.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "Cancellation Status",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          controller.isPending.value
                              ? ImageAssets.pendingIcon
                              : ImageAssets.cancelIcon,
                          scale: 2,
                        ),
                        6.w.horizontalSpace,
                        Text(
                          controller.isPending.value ? "Pending" : "Cancelled",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            12.h.verticalSpace,
            Divider(
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            12.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "Cancellation Date",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "June 15, 2024",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            12.h.verticalSpace,
            Divider(
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.showCharge.value
                      ? 12.h.verticalSpace
                      : 0.h.verticalSpace,
                  controller.showCharge.value
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20.w),
                              child: Text(
                                "Cancellation Charged",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "\$ 32.20 (15%)",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                      : 0.h.verticalSpace,
                  controller.showCharge.value
                      ? 12.h.verticalSpace
                      : 0.h.verticalSpace,
                  controller.showCharge.value
                      ? Divider(
                          color: ColorUtils.borderColor.withOpacity(0.5),
                        )
                      : 0.h.verticalSpace,
                ],
              ),
            ),
            20.h.verticalSpace,
            Text(
              "Cancellation Reason",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            10.h.verticalSpace,
            Text(
              "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui prant ad dapibus tempus natoque a. Rhoncus praesent massa toent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus.",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: ColorUtils.textColor),
            ),
            12.h.verticalSpace,
            Divider(
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            20.h.verticalSpace,
            Text(
              "Job Details",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            12.h.verticalSpace,
            Divider(
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            Text(
              "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis quam.",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.black),
            ),
            10.h.verticalSpace,
            Text(
              "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus.",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: ColorUtils.textColor),
            ),
            24.h.verticalSpace,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageAssets.img1,
                      scale: 1.8,
                    ),
                    Image.asset(
                      ImageAssets.img2,
                      scale: 1.8,
                    ),
                    Image.asset(
                      ImageAssets.img3,
                      scale: 1.8,
                    ),
                  ],
                ),
                30.h.verticalSpace,
                Column(
                  children: List.generate(
                    controller.dummyData.length,
                    (index) => Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontWeight: FontWeight.w500,
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
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: 0.3.sw,
                          margin: EdgeInsets.only(right: 20.w),
                          child: Text(
                            "Job Location",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "New York, NY ",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            5.w.horizontalSpace,
                            Text(
                              "(View Map)",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ColorUtils.red,
                                  decorationColor: ColorUtils.red,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ],
                    ),
                    30.h.verticalSpace,
                  ],
                ),
              ],
            ),
          ],
        )),
      ],
    ));
  }
}
