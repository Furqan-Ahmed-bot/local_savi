import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/controllers/professional_controllers/p_jobs_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PJobsScreen extends GetWidget<PJobsController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.only(
              left: 20.w, right: 20.w, bottom: 110.h, top: 30.h),
          children: [
            Obx(
              () => Container(
                width: 1.0.sw,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        5,
                        (index) => GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = index;
                                controller.update();
                              },
                              child: Container(
                                width: 120.w,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10.w),
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                decoration: BoxDecoration(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? ColorUtils.red
                                            : ColorUtils.white,
                                    borderRadius: BorderRadius.circular(10.sp),
                                    border: Border.all(
                                        width: 1.w,
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? ColorUtils.red
                                            : ColorUtils.borderColor
                                                .withOpacity(0.5))),
                                child: Text(
                                  controller.names[index],
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: controller.selectedIndex.value ==
                                              index
                                          ? ColorUtils.white
                                          : ColorUtils.black),
                                ),
                              ),
                            )),
                  ),
                ),
              ),
            ),
            20.h.verticalSpace,
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: SizedBox(
                        child: spinkit,
                      ),
                    )
                  : GetBuilder<PJobsController>(
                      builder: (controller) => controller
                                  .names[controller.selectedIndex.value] ==
                              "Applied"
                          ? controller.appliedJobsList.isEmpty
                              ? const Center(
                                  child: Text(" No Applied Jobs Available"))
                              : Column(
                                  children: List.generate(
                                      controller.appliedJobsList.length,
                                      (index) => GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                RouteName.pJobsDetailScreenPath,
                                                arguments: {
                                                  "jobId": controller
                                                      .appliedJobsList[index]
                                                      .id,
                                                  "showBottomButton": false,
                                                  "status": "Job Open",
                                                  "showActionButton": false,
                                                  "bottomButtonText": ""
                                                });
                                          },
                                          child: activeJobCard(
                                              title: controller
                                                  .appliedJobsList[index].title,
                                              desc: controller
                                                  .appliedJobsList[index]
                                                  .description,
                                              budget: controller
                                                  .appliedJobsList[index]
                                                  .budget,
                                              date: controller
                                                  .appliedJobsList[index]
                                                  .jobDate,
                                              time: controller
                                                  .appliedJobsList[index]
                                                  .startTime,
                                              status: controller.names[
                                                  controller
                                                      .selectedIndex.value]))),
                                )
                          : controller.names[controller.selectedIndex.value] ==
                                  "Upcoming"
                              ? controller.upcomingJobsList.isEmpty
                                  ? const Center(
                                      child: Text("No Upcoming Jobs Available"))
                                  : Column(
                                      children: List.generate(
                                          controller.upcomingJobsList.length,
                                          (index) => GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    RouteName
                                                        .pJobsDetailScreenPath,
                                                    arguments: {
                                                      "jobId": controller
                                                          .upcomingJobsList[
                                                              index]
                                                          .id,
                                                      "showBottomButton": true,
                                                      "status": "Job Open",
                                                      "showActionButton": false,
                                                      "bottomButtonText":
                                                          "Cancel Job"
                                                    });
                                              },
                                              child: activeJobCard(
                                                  title: controller
                                                      .upcomingJobsList[index]
                                                      .title,
                                                  desc: controller
                                                      .upcomingJobsList[index]
                                                      .description,
                                                  budget: controller
                                                      .upcomingJobsList[index]
                                                      .budget,
                                                  date: controller
                                                      .upcomingJobsList[index]
                                                      .jobDate,
                                                  time: controller
                                                      .upcomingJobsList[index]
                                                      .startTime,
                                                  status: controller.names[
                                                      controller.selectedIndex
                                                          .value]))),
                                    )
                              : controller.names[
                                          controller.selectedIndex.value] ==
                                      "Ongoing"
                                  ? controller.ongoingJobsList.isEmpty
                                      ? const Center(
                                          child: Text(
                                              " No Ongoing Jobs Available"))
                                      : Column(
                                          children: List.generate(
                                              controller.ongoingJobsList.length,
                                              (index) => GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        RouteName
                                                            .pJobsDetailScreenPath,
                                                        arguments: {
                                                          "jobId": controller
                                                              .ongoingJobsList[
                                                                  index]
                                                              .id,
                                                          "showBottomButton":
                                                              true,
                                                          "status": "Ongoing",
                                                          "showActionButton":
                                                              false,
                                                          "bottomButtonText":
                                                              "On The Way"
                                                        });
                                                  },
                                                  child: activeJobCard(
                                                      title: controller
                                                          .ongoingJobsList[
                                                              index]
                                                          .title,
                                                      desc: controller
                                                          .ongoingJobsList[
                                                              index]
                                                          .description,
                                                      budget: controller
                                                          .ongoingJobsList[
                                                              index]
                                                          .budget,
                                                      date: controller
                                                          .ongoingJobsList[
                                                              index]
                                                          .jobDate,
                                                      time: controller
                                                          .ongoingJobsList[
                                                              index]
                                                          .startTime,
                                                      status: controller.names[
                                                          controller
                                                              .selectedIndex
                                                              .value]))),
                                        )
                                  : controller.names[
                                              controller.selectedIndex.value] ==
                                          "Completed"
                                      ? controller.completedJobsList.isEmpty
                                          ? const Center(
                                              child: Text(
                                                  " No Completed Jobs Available"))
                                          : Column(
                                              children: List.generate(
                                                  controller
                                                      .completedJobsList.length,
                                                  (index) => GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            RouteName
                                                                .pJobsDetailScreenPath,
                                                            arguments: {
                                                              "jobId": controller
                                                                  .completedJobsList[
                                                                      index]
                                                                  .id,
                                                              "showBottomButton":
                                                                  false,
                                                              "status":
                                                                  "Completed",
                                                              "showActionButton":
                                                                  false,
                                                              "bottomButtonText":
                                                                  ""
                                                            });
                                                      },
                                                      child: activeJobCard(
                                                          status: controller
                                                                  .names[
                                                              controller
                                                                  .selectedIndex
                                                                  .value]))),
                                            )
                                      : Column(
                                          children: List.generate(
                                              controller
                                                  .cancelledJobsList.length,
                                              (index) => GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          RouteName
                                                              .cancelledJobScreenPath,
                                                          arguments: {
                                                            "isPending": controller
                                                                    .cancelledJobsList[
                                                                        index]
                                                                    .jobStatus !=
                                                                "CANCELLED",
                                                            "jobId": controller
                                                                .cancelledJobsList[
                                                                    index]
                                                                .id,
                                                            "showCharge": false,
                                                          });
                                                    },
                                                    child: Container(
                                                      width: 1.0.sw,
                                                      margin: EdgeInsets.only(
                                                          bottom: 16.h),
                                                      padding:
                                                          EdgeInsets.all(10.sp),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.white,
                                                        border: Border.all(
                                                            width: 1.w,
                                                            color: ColorUtils
                                                                .borderColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 0.43.sw,
                                                                child: Text(
                                                                  "Job Details",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16.sp,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              ),
                                                              Text(
                                                                "${controller.cancelledJobsList[index].jobStatus} |   ${DateFormat('d MMMM').format(DateTime.parse(controller.cancelledJobsList[index].jobDate.toString()))}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: ColorUtils
                                                                        .borderColor),
                                                              )
                                                            ],
                                                          ),
                                                          6.h.verticalSpace,
                                                          Text(
                                                              "${controller.cancelledJobsList[index].description}"),
                                                          12.h.verticalSpace,
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                        )),
            ),
          ],
        ),
      )
    ]));
  }
}
