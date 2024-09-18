import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_job_detail_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
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
            : SizedBox.shrink(),
      ),
      body: myBackGround(
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
                  : SizedBox.shrink(),
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
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Status: ",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () => Text(
                          controller.status.value,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: controller.status.value == "Completed"
                                  ? ColorUtils.green
                                  : ColorUtils.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              13.h.verticalSpace,
              pJobDetailUserCard(
                  context: context,
                  name: "John Smith",
                  city: "New York, NY",
                  isVerified: false,
                  postedDate: "June 20, 2024",
                  image: ImageAssets.johnImg),
              // 10.h.verticalSpace,
              Divider(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
              10.h.verticalSpace,
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
                      30.h.verticalSpace
                    ],
                  ),
                ],
              ),
            ],
          )),
        ],
      )),
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
