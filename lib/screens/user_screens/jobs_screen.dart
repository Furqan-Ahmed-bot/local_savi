import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/jobs_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';

import 'package:local_saviors/utils/routes/routes.dart';

class JobsScreen extends GetWidget<JobsScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 110.h, top: 30.h),
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
                                    color: controller.selectedIndex.value == index ? ColorUtils.red : ColorUtils.white,
                                    borderRadius: BorderRadius.circular(10.sp),
                                    border: Border.all(
                                        width: 1.w,
                                        color: controller.selectedIndex.value == index ? ColorUtils.red : ColorUtils.borderColor.withOpacity(0.5))),
                                child: Text(
                                  controller.names[index],
                                  style: TextStyle(
                                      fontSize: 16.sp, color: controller.selectedIndex.value == index ? ColorUtils.white : ColorUtils.black),
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
                      child: spinkit,
                    )
                  : GetBuilder<JobsScreenController>(
                      builder: (controller) => controller.names[controller.selectedIndex.value] == "Open"
                          ? controller.openJobsList.isNotEmpty
                              ? Column(
                                  children: List.generate(
                                      controller.openJobsList.length,
                                      (index) => GestureDetector(
                                            onTap: () {
                                              Get.toNamed(RouteName.jobPostedScreenPath, arguments: {"jobId": controller.openJobsList[index].id});
                                            },
                                            child: activeJobCard(
                                                time: controller.openJobsList[index].startTime,
                                                budget: controller.openJobsList[index].budget,
                                                date: controller.openJobsList[index].startTime,
                                                workerType: controller.openJobsList[index].workerType,
                                                desc: controller.openJobsList[index].description,
                                                title: controller.openJobsList[index].title),
                                          )),
                                )
                              : const Center(child: Text(" No Open Jobs Available"))
                          : controller.names[controller.selectedIndex.value] == "Upcoming"
                              ? controller.upcomingJobsList.isNotEmpty
                                  ? Column(
                                      children: List.generate(
                                          controller.upcomingJobsList.length,
                                          (index) => GestureDetector(
                                              onTap: () {
                                                Get.toNamed(RouteName.upcomingJobDetailScreenPath,
                                                    arguments: {"jobId": controller.upcomingJobsList[index].id});
                                              },
                                              child: activeJobCard(
                                                  date: controller.upcomingJobsList[index].startTime,
                                                  workerType: controller.upcomingJobsList[index].workerType,
                                                  desc: controller.upcomingJobsList[index].description,
                                                  title: controller.upcomingJobsList[index].title))),
                                    )
                                  : const Center(child: Text(" No Upcoming Jobs Available"))
                              : controller.names[controller.selectedIndex.value] == "Ongoing"
                                  ? controller.ongoingJobsList.isNotEmpty
                                      ? Column(
                                          children: List.generate(
                                              controller.ongoingJobsList.length,
                                              (index) => GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(RouteName.ongoingJobDetailScreenPath);
                                                  },
                                                  child: activeJobCard(
                                                      date: controller.ongoingJobsList[index].startTime,
                                                      workerType: controller.ongoingJobsList[index].workerType,
                                                      desc: controller.ongoingJobsList[index].description,
                                                      title: controller.ongoingJobsList[index].title))),
                                        )
                                      : const Center(child: Text(" No Ongoing Jobs Available"))
                                  : controller.names[controller.selectedIndex.value] == "Completed"
                                      ? controller.completedJobsList.isNotEmpty
                                          ? Column(
                                              children: List.generate(
                                                  controller.completedJobsList.length,
                                                  (index) => GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(RouteName.jobCompletedScreenPath);
                                                      },
                                                      child: activeJobCard(
                                                          date: controller.completedJobsList[index].startTime,
                                                          workerType: controller.completedJobsList[index].workerType,
                                                          desc: controller.completedJobsList[index].description,
                                                          title: controller.completedJobsList[index].title))),
                                            )
                                          : const Center(child: Text(" No Completed Jobs Available"))
                                      : Column(
                                          children: List.generate(
                                              controller.listOfCancelledCard.length,
                                              (index) => GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(RouteName.cancelledJobScreenPath,
                                                          arguments: {"isPending": controller.listOfCancelledCard[index]["status"] == "Pending"});
                                                    },
                                                    child: Container(
                                                      width: 1.0.sw,
                                                      margin: EdgeInsets.only(bottom: 16.h),
                                                      padding: EdgeInsets.all(10.sp),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.white,
                                                        border: Border.all(width: 1.w, color: ColorUtils.borderColor),
                                                        borderRadius: BorderRadius.circular(10.r),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 0.43.sw,
                                                                child: Text(
                                                                  "Job Details",
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold, fontSize: 16.sp, overflow: TextOverflow.ellipsis),
                                                                ),
                                                              ),
                                                              Text(
                                                                "${controller.listOfCancelledCard[index]["status"]} | ${controller.listOfCancelledCard[index]["date"]}",
                                                                style: TextStyle(fontSize: 12.sp, color: ColorUtils.borderColor),
                                                              )
                                                            ],
                                                          ),
                                                          6.h.verticalSpace,
                                                          Text("${controller.listOfCancelledCard[index]["desc"]}"),
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
