import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/ongoing_job_detail_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class OngoingJobDetailScreen
    extends GetWidget<OngoingJobDetailScreenController> {
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(width: 1.w, color: ColorUtils.borderColor),
                  color: ColorUtils.trakNowbgColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImageAssets.greenVerifiedIcon,
                        scale: 2,
                      ),
                      10.w.horizontalSpace,
                      Text(
                        "William Roy On the way",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorUtils.red,
                      ),
                      child: Text(
                        "Track Now",
                        style: TextStyle(color: ColorUtils.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.h.verticalSpace,
            Text(
              "Employee",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            12.h.verticalSpace,
            shortlistUserCard(
                context: context,
                name: "Oliver Mark",
                rating: "(4.5)",
                isVerified: true,
                showSelectJobButton: false,
                image: ImageAssets.oliverImg),
            28.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Job Details",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Job Ongoing",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorUtils.blue),
                ),
              ],
            ),
            13.h.verticalSpace,
            Divider(
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            20.h.verticalSpace,
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