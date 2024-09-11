import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/posted_job_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PostedJobScreen extends GetWidget<PostedJobScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        appbar(isMenu: false, title: "Job Details", actions: [
          GestureDetector(
            onTap: () {
              // Get.toNamed(RouteName.notificationsScreenPath);
            },
            child: Container(
              margin: EdgeInsets.only(right: 20.w),
              padding: EdgeInsets.all(8.sp),
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
              child: Image.asset(
                ImageAssets.threeDots,
                color: ColorUtils.red,
                scale: 2,
              ),
            ),
          ),
        ]),
        Expanded(
            child: ListView(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.userRequestScreenPath);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: ColorUtils.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorUtils.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageAssets.requestGroupImgs,
                          scale: 2,
                        ),
                        10.w.horizontalSpace,
                        Text(
                          "08 User Request",
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorUtils.txtColor),
                        )
                      ],
                    ),
                    Image.asset(
                      ImageAssets.forwardArrow,
                      scale: 2,
                    )
                  ],
                ),
              ),
            ),
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
                  "Job Open",
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
            Obx(
              () => Visibility(
                  visible: controller.isViewDetail.value,
                  child: Column(
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
                          20.h.verticalSpace,
                        ],
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                controller.isViewDetail.value = !controller.isViewDetail.value;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    ImageAssets.viewDetailIcon,
                    scale: 2,
                  ),
                  10.w.horizontalSpace,
                  Text(
                    "View Details",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: ColorUtils.red,
                        decorationColor: ColorUtils.red,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            18.h.verticalSpace,
            Divider(
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            20.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "You have sent invitation 3 users",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.textColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.inviteUserScreenPath);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.w, color: ColorUtils.borderColor),
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorUtils.white,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageAssets.applyJobs,
                          scale: 2,
                        ),
                        7.w.horizontalSpace,
                        Text(
                          "Re-Hire",
                          style: TextStyle(
                              fontSize: 14.sp, color: ColorUtils.black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            19.h.verticalSpace,
            Divider(
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            20.h.verticalSpace,
            Row(
              children: [
                Text(
                  "Shortlist Users",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                6.w.horizontalSpace,
                Text(
                  "(3)",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            16.h.verticalSpace,
            Column(
              children: List.generate(
                  controller.listOfBestPerformers.length,
                  (index) => shortlistUserCard(
                      context: context,
                      isVerified: controller.listOfBestPerformers[index]
                          ['isVerified'],
                      image: controller.listOfBestPerformers[index]['image'],
                      name: controller.listOfBestPerformers[index]['name'],
                      rating: controller.listOfBestPerformers[index]
                          ['rating'])),
            )
          ],
        )),
      ],
    ));
  }
}
