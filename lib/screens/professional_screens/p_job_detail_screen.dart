import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/controllers/professional_controllers/p_job_detail_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PJobDetailScreen extends GetWidget<PJobDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => controller.showBottomButton.value
            ? Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
                child: RoundButton(
                  title: controller.buttonText.value,
                  onPress: () {
                    controller.buttonText.value == "Cancel Job"
                        ? showCancelDialog(context)
                        : controller.buttonText.value == "On The Way"
                            ? controller.buttonText.value = "Arrived"
                            : controller.buttonText.value == "Arrived"
                                ? controller.buttonText.value =
                                    "Mark As Completed"
                                : controller.buttonText.value ==
                                        "Mark As Completed"
                                    ? showThankyouDialog(context)
                                    : showThankyouDialog(context);
                  },
                  buttonColor: ColorUtils.red,
                  width: 1.0.sw,
                ),
              )
            : const SizedBox.shrink(),
      ),
      body: GetBuilder<PJobDetailController>(builder: (controller) {
        return Obx(() => controller.isLoading.value
            ? Center(
                child: spinkit,
              )
            : controller.jobDetailDatail != {}
                ? myBackGround(
                    child: Column(
                    children: [
                      appbar(isMenu: false, title: "Job Details", actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: controller.showActionButton.value
                              ? Image.asset(
                                  ImageAssets.saveIcon,
                                  scale: 2.5,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ]),
                      Expanded(
                          child: ListView(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Job Details",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Status: ",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.jobDetailDatail['job_status'],
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        color: controller.jobDetailDatail[
                                                    'job_status'] ==
                                                "COMPLETED"
                                            ? ColorUtils.green
                                            : ColorUtils.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          13.h.verticalSpace,
                          pJobDetailUserCard(
                              context: context,
                              name: controller.jobDetailDatail['user']
                                      ['user_details']['first_name'] +
                                  " " +
                                  controller.jobDetailDatail['user']
                                      ['user_details']['last_name'],
                              city: "New York, NY",
                              isVerified: false,
                              postedDate: DateFormat("MMM d, yyyy").format(
                                  DateTime.parse(
                                      controller.jobDetailDatail['createdAt'])),
                              image: ImageAssets.johnImg),
                          // 10.h.verticalSpace,
                          Divider(
                            color: ColorUtils.borderColor.withOpacity(0.5),
                          ),
                          10.h.verticalSpace,
                          Text(
                            controller.jobDetailDatail['title'] ?? "",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorUtils.black),
                          ),
                          10.h.verticalSpace,
                          Text(
                            controller.jobDetailDatail['description'],
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorUtils.textColor),
                          ),
                          24.h.verticalSpace,
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            .jobDetailDatail['worker_type'],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        (controller.jobDetailDatail['budget'] ??
                                                "" +
                                                    "-" +
                                                    controller.jobDetailDatail[
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                controller.jobDetailDatail[
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                .jobDetailDatail['job_date'])),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        controller.jobDetailDatail['address'],
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
                                                .jobDetailDatail['location'],
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
                          ),
                        ],
                      )),
                    ],
                  ))
                : const Center(
                    child: Text("No Job Detail Available"),
                  ));
      }),
    );
  }

  void showCancelDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
                        shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                    child: Image.asset(
                      ImageAssets.bigCross,
                      scale: 2,
                    ),
                  ),
                  20.h.verticalSpace,
                  Text(
                    "Cancel Job!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUtils.black,
                      fontSize: 22.sp,
                    ),
                  ),
                  24.h.verticalSpace,
                  Text(
                    "Are you sure you want to Cancel this job?",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(RouteName.pCanceJobReasonScreenPath);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                              color: ColorUtils.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  width: 1.w, color: ColorUtils.borderColor)),
                          child: const Text("Yes, Cancel"),
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
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorUtils.red,
                          ),
                          child: Text(
                            "No",
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
  }

  void showThankyouDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
                        shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                    child: Image.asset(
                      ImageAssets.jobDoneIcon,
                      scale: 2,
                    ),
                  ),
                  20.h.verticalSpace,
                  Text(
                    "Thank You!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUtils.black,
                      fontSize: 22.sp,
                    ),
                  ),
                  20.h.verticalSpace,
                  Text(
                    "Your request has been submitted",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUtils.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                width: 1.0.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.close(2);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 30.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorUtils.red,
                        ),
                        child: Text(
                          "Go Back",
                          style: TextStyle(color: ColorUtils.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
