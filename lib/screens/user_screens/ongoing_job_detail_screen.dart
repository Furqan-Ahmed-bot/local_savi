import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/ongoing_job_detail_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

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
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border:
                        Border.all(width: 1.w, color: ColorUtils.borderColor),
                    color: ColorUtils.trakNowbgColor),
                child: Column(
                  children: [
                    Row(
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
                        controller.isReached.value
                            ? SizedBox.shrink()
                            : GestureDetector(
                                onTap: () {
                                  // Get.back();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7.h, horizontal: 20.w),
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
                    controller.isReached.value
                        ? 20.h.verticalSpace
                        : 0.h.verticalSpace,
                    controller.isReached.value
                        ? Row(
                            children: [
                              30.w.horizontalSpace,
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          backgroundColor:
                                              ColorUtils.dialogeBGColor,
                                          content: SizedBox(
                                            width: 1.0.sw,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                20.h.verticalSpace,
                                                Container(
                                                  padding:
                                                      EdgeInsets.all(23.sp),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorUtils.jobIconBG),
                                                  child: Image.asset(
                                                    ImageAssets.payNowIcon,
                                                    scale: 2,
                                                  ),
                                                ),
                                                20.h.verticalSpace,
                                                Text(
                                                  "Pay Now!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorUtils.black,
                                                    fontSize: 22.sp,
                                                  ),
                                                ),
                                                24.h.verticalSpace,
                                                Text(
                                                  "Are your sure you want to pay?",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorUtils.black,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            Container(
                                              width: 1.0.sw,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                insetPadding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                backgroundColor:
                                                                    ColorUtils
                                                                        .dialogeBGColor,
                                                                content:
                                                                    SizedBox(
                                                                  width: 1.0.sw,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      20.h.verticalSpace,
                                                                      Container(
                                                                        padding:
                                                                            EdgeInsets.all(23.sp),
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color: ColorUtils.jobIconBG),
                                                                        child: Image
                                                                            .asset(
                                                                          ImageAssets
                                                                              .jobDoneIcon,
                                                                          scale:
                                                                              2,
                                                                        ),
                                                                      ),
                                                                      20.h.verticalSpace,
                                                                      Text(
                                                                        "Job Done!",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ColorUtils.black,
                                                                          fontSize:
                                                                              22.sp,
                                                                        ),
                                                                      ),
                                                                      24.h.verticalSpace,
                                                                      Text(
                                                                        "Payment transfer successfully!",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ColorUtils.black,
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  Container(
                                                                    width:
                                                                        1.0.sw,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Get.close(2);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              alignment: Alignment.center,
                                                                              padding: EdgeInsets.symmetric(vertical: 15.h),
                                                                              decoration: BoxDecoration(color: ColorUtils.white, borderRadius: BorderRadius.circular(10.r), border: Border.all(width: 1.w, color: ColorUtils.borderColor)),
                                                                              child: const Text("Go back"),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        20.w.horizontalSpace,
                                                                        Expanded(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Get.close(2);
                                                                              Get.offAndToNamed(RouteName.rateEmployeeScreenPath);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              alignment: Alignment.center,
                                                                              padding: EdgeInsets.symmetric(vertical: 15.h),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.r),
                                                                                color: ColorUtils.red,
                                                                              ),
                                                                              child: Text(
                                                                                "Rate Employee",
                                                                                style: TextStyle(color: ColorUtils.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 15.h),
                                                        decoration: BoxDecoration(
                                                            color: ColorUtils
                                                                .white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                                width: 1.w,
                                                                color: ColorUtils
                                                                    .borderColor)),
                                                        child: const Text(
                                                            "Yes, Select"),
                                                      ),
                                                    ),
                                                  ),
                                                  20.w.horizontalSpace,
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 15.h),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          color: ColorUtils.red,
                                                        ),
                                                        child: Text(
                                                          "No",
                                                          style: TextStyle(
                                                              color: ColorUtils
                                                                  .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7.h, horizontal: 25.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: ColorUtils.red,
                                  ),
                                  child: Text(
                                    "Pay Now",
                                    style: TextStyle(color: ColorUtils.white),
                                  ),
                                ),
                              ),
                              10.w.horizontalSpace,
                              GestureDetector(
                                onTap: () {
                                  // Get.back();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7.h, horizontal: 25.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: ColorUtils.white,
                                  ),
                                  child: Text(
                                    "Dispute",
                                    style: TextStyle(color: ColorUtils.black),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink()
                  ],
                ),
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
            GestureDetector(
              onTap: () {
                controller.isReached.value = true;
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Job Details",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
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
                          30.h.verticalSpace,
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      ],
    ));
  }
}
