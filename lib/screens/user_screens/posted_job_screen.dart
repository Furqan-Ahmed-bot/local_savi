import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/controllers/user_controllers/posted_job_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
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
              showModalBottomSheet(
                context: context,
                builder: (context) =>
                    Column(mainAxisSize: MainAxisSize.min, children: [
                  20.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      Text(
                        "Options",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20.w),
                          decoration: BoxDecoration(
                              color: const Color(0xFF00000091),
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Image.asset(
                            ImageAssets.cutIcon,
                            scale: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Divider(
                    color: ColorUtils.borderColor.withOpacity(0.5),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.toNamed(RouteName.editJobScreenPath);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.editIcon,
                          scale: 2,
                          color: ColorUtils.borderColor,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Edit Job   ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Divider(
                    color: ColorUtils.borderColor.withOpacity(0.5),
                  ),
                  10.verticalSpace,
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 20.w),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              backgroundColor: ColorUtils.dialogeBGColor,
                              content: SizedBox(
                                width: 1.0.sw,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    20.h.verticalSpace,
                                    Container(
                                      padding: EdgeInsets.all(23.sp),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.jobIconBG),
                                      child: Image.asset(
                                        ImageAssets.deleteBigIcon,
                                        scale: 2,
                                      ),
                                    ),
                                    20.h.verticalSpace,
                                    Text(
                                      "Delete Job!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorUtils.black,
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                    24.h.verticalSpace,
                                    Text(
                                      "Are you sure you want to delete this job?",
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.close(3);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.h),
                                            decoration: BoxDecoration(
                                                color: ColorUtils.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                border: Border.all(
                                                    width: 1.w,
                                                    color: ColorUtils
                                                        .borderColor)),
                                            child: const Text("Yes, Select"),
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
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.h),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: ColorUtils.red,
                                            ),
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                  color: ColorUtils.white),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.deleteIcon,
                          scale: 2,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Delete Job',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  50.verticalSpace,
                ]),
              );
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
        Obx(
          () => controller.isLoading.value
              ? Center(
                  child: spinkit,
                )
              : GetBuilder<PostedJobScreenController>(builder: (controller) {
                  return Expanded(
                      child: ListView(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.userRequestScreenPath,
                              arguments: {
                                "users":
                                    controller.jobDetailData['user_requests']
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
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
                                    "${controller.jobDetailData['user_requests'].length.toString()} User Request",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: ColorUtils.txtColor),
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
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            controller.jobDetailData['job_status'],
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
                        controller.jobDetailData['title'],
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black),
                      ),
                      10.h.verticalSpace,
                      Text(
                        controller.jobDetailData['description'],
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
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      controller
                                          .jobDetailData['job_media'].length,
                                      (index) => Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                  width: 100,
                                                  height: 100,
                                                  controller.jobDetailData[
                                                          'job_media'][index]
                                                      ['media_file']),
                                            ),
                                          )),
                                ),
                                30.h.verticalSpace,
                                Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 0.3.sw,
                                        margin: EdgeInsets.only(right: 20.w),
                                        child: Text(
                                          "Worker Type",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          controller
                                              .jobDetailData['worker_type'],
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.h.verticalSpace,
                                  Divider(
                                    color:
                                        ColorUtils.borderColor.withOpacity(0.5),
                                  ),
                                  10.h.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 0.3.sw,
                                        margin: EdgeInsets.only(right: 20.w),
                                        child: Text(
                                          "Job Budget",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          (controller.jobDetailData['budget']
                                                      .toString() +
                                                  "-" +
                                                  controller.jobDetailData[
                                                      'budget_type'])
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.h.verticalSpace,
                                  Divider(
                                    color:
                                        ColorUtils.borderColor.withOpacity(0.5),
                                  ),
                                  10.h.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 0.3.sw,
                                        margin: EdgeInsets.only(right: 20.w),
                                        child: Text(
                                          "Job Time",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          DateFormat("HH:mm").format(
                                              DateTime.parse(
                                                  controller.jobDetailData[
                                                      'start_time'])),
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.h.verticalSpace,
                                  Divider(
                                    color:
                                        ColorUtils.borderColor.withOpacity(0.5),
                                  ),
                                  10.h.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 0.3.sw,
                                        margin: EdgeInsets.only(right: 20.w),
                                        child: Text(
                                          "Job Date",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          DateFormat("MMM d, yyyy").format(
                                              DateTime.parse(controller
                                                  .jobDetailData['job_date'])),
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.h.verticalSpace,
                                  Divider(
                                    color:
                                        ColorUtils.borderColor.withOpacity(0.5),
                                  ),
                                  10.h.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 0.3.sw,
                                        margin: EdgeInsets.only(right: 20.w),
                                        child: Text(
                                          "Job Address",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          controller.jobDetailData['address'],
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.h.verticalSpace,
                                  Divider(
                                    color:
                                        ColorUtils.borderColor.withOpacity(0.5),
                                  ),
                                  10.h.verticalSpace,
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Container(
                                  //       // width: 0.3.sw,
                                  //       margin: EdgeInsets.only(right: 20.w),
                                  //       child: Text(
                                  //         "Job Location",
                                  //         style: TextStyle(
                                  //           fontSize: 16.sp,
                                  //           fontWeight: FontWeight.w600,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Flexible(
                                  //       child: Text(
                                  //         ,
                                  //         style: TextStyle(
                                  //           fontSize: 16.sp,
                                  //           fontWeight: FontWeight.w500,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // 10.h.verticalSpace,
                                  // Divider(
                                  //   color:
                                  //       ColorUtils.borderColor.withOpacity(0.5),
                                  // ),
                                  // 10.h.verticalSpace,
                                ]),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              controller
                                                  .jobDetailData['location'],
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
                                                  decorationColor:
                                                      ColorUtils.red,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    30.h.verticalSpace
                                  ],
                                ),
                              ],
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.isViewDetail.value =
                              !controller.isViewDetail.value;
                        },
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              controller.isViewDetail.value
                                  ? RotatedBox(
                                      quarterTurns: 90,
                                      child: Image.asset(
                                        ImageAssets.viewDetailIcon,
                                        scale: 2,
                                      ),
                                    )
                                  : Image.asset(
                                      ImageAssets.viewDetailIcon,
                                      scale: 2,
                                    ),
                              10.w.horizontalSpace,
                              Text(
                                controller.isViewDetail.value
                                    ? "Close Details"
                                    : "View Details",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: ColorUtils.red,
                                    decorationColor: ColorUtils.red,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
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
                            "You have sent invitation ${controller.jobDetailData['invite_users'].length.toString()} users",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorUtils.textColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteName.inviteUserScreenPath,
                                  arguments: {
                                    "users":
                                        controller.jobDetailData['invite_users']
                                  });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: ColorUtils.borderColor),
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
                                        fontSize: 14.sp,
                                        color: ColorUtils.black),
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
                            "(${controller.jobDetailData['user_requests'].length.toString()})",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      16.h.verticalSpace,
                      Column(
                        children: controller.jobDetailData['user_requests'].isNotEmpty
                            ? List.generate(
                                controller
                                    .jobDetailData['user_requests'].length,
                                (index) => shortlistUserCard(
                                    id: controller.jobDetailData['user_requests']
                                        [index]['id'],
                                    context: context,
                                    showSelectJobButton: controller.jobDetailData['user_requests']
                                            [index]['invite_status'] ==
                                        "ACCEPTED",
                                    isVerified: controller.listOfBestPerformers[index]
                                        ['isVerified'],
                                    image: controller.listOfBestPerformers[index]
                                        ['image'],
                                    name: controller.jobDetailData['user_requests'][index]['performer']
                                            ['user_details']['first_name'] +
                                        " " +
                                        controller.jobDetailData['user_requests'][index]
                                            ['performer']['user_details']['last_name'],
                                    rating: controller.listOfBestPerformers[index]['rating']))
                            : [const Text("No shortlist users")],
                      )
                    ],
                  ));
                }),
        ),
      ],
    ));
  }
}
