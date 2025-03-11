// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/controllers/user_controllers/jobs_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';

import 'package:local_saviors/utils/routes/routes.dart';

class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final controller = Get.put(JobsScreenController());

  @override
  void initState() {
    controller.getJobs("OPEN");
    controller.selectedIndex.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
        child: Column(
          children: [
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
                            controller.names.length,
                            (index) => GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = index;

                                if (index == 0) {
                                  controller.getJobs('OPEN');
                                } else if (index == 1) {
                                  controller.getJobs("UPCOMING");
                                  return;
                                } else if (index == 2) {
                                  controller.getJobs("ONGOING");
                                } else if (index == 3) {
                                  controller.getJobs("COMPLETED");
                                } else {
                                  controller.getJobs("CANCELLED");
                                }
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
                                    color: controller.selectedIndex.value == index ? ColorUtils.red : ColorUtils.borderColor.withOpacity(0.5),
                                  ),
                                ),
                                child: Text(
                                  controller.names[index],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: controller.selectedIndex.value == index ? ColorUtils.white : ColorUtils.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.h.verticalSpace,
                  Obx(
                    () => controller.isLoading.value ? Center(child: spinkit) : buildJobList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJobList() {
    String selectedCategory = controller.names[controller.selectedIndex.value];
    List jobList;
    String emptyMessage;
    String routePath;

    switch (selectedCategory) {
      case "Open":
        jobList = controller.openJobsList;
        emptyMessage = "No Open Jobs Available";
        routePath = RouteName.jobPostedScreenPath;
        break;
      case "Upcoming":
        jobList = controller.upcomingJobsList;
        emptyMessage = "No Upcoming Jobs Available";
        routePath = RouteName.upcomingJobDetailScreenPath;
        break;
      case "Ongoing":
        jobList = controller.ongoingJobsList;
        emptyMessage = "No Ongoing Jobs Available";
        routePath = RouteName.ongoingJobDetailScreenPath;
        break;
      case "Completed":
        jobList = controller.completedJobsList;
        emptyMessage = "No Completed Jobs Available";
        routePath = RouteName.jobCompletedScreenPath;
        break;
      default:
        jobList = controller.cancelledJobsList;
        emptyMessage = "No Cancelled Jobs Available";
        routePath = RouteName.cancelledJobScreenPath;
    }

    if (jobList.isEmpty) {
      return Center(child: Text(emptyMessage));
    }

    return Column(
      children: List.generate(
        jobList.length,
        (index) => GestureDetector(
          onTap: () {
            Get.toNamed(routePath, arguments: {"jobId": jobList[index].id});
          },
          child: activeJobCard(
            time: jobList[index].startTime,
            budget: jobList[index].decidedCost?.toString() ?? jobList[index].budget,
            date: jobList[index].startTime,
            workerType: jobList[index].workerType,
            desc: jobList[index].description,
            title: jobList[index].title,
          ),
        ),
      ),
    );
  }
}
