// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_home_controller.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import 'package:shimmer/shimmer.dart';


class PHomeScreen extends GetWidget<PHomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: myBackGround(
          child: Obx(
            () => controller.isLaoding.value
                ? shimmerJobList(context)
                : GetBuilder<PHomeController>(builder: (controller) {
                    return Column(
                      children: [
                        Expanded(
                            child: ListView(
                          padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              bottom: 110.h,
                              top: 20.h),
                          children: [
                            Column(
                              children: [
                                EditText(
                                  hintText: "Search",
                                  context: context,
                                  suffixIcon: ImageAssets.filterIcon,
                                  suffixClick: () {
                                    Get.toNamed(
                                        RouteName.psearchFilterScreenPath);
                                  },
                                  bordercolor: Colors.transparent,
                                ),
                                20.h.verticalSpace,
                                controller.isLaoding.value
                                    ? Center(
                                        child: spinkit,
                                      )
                                    : controller.listOfJobs.isEmpty
                                        ? const Center(
                                            child: Center(
                                                child:
                                                    Text("No Jobs Available")))
                                        : Column(
                                            children: List.generate(
                                                controller.listOfJobs.length,
                                                (index) => InkWell(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          RouteName
                                                              .pJobsDetailScreenPath,
                                                          arguments: {
                                                            "showBottomButton":
                                                                true,
                                                            "status":
                                                                "Job Open",
                                                            "showActionButton":
                                                                true,
                                                            "bottomButtonText":
                                                                "Apply Now",
                                                            "jobId": controller
                                                                .listOfJobs[
                                                                    index]
                                                                .id
                                                          });
                                                    },
                                                    child: applyJobCard(
                                              
                                                      id: controller
                                                          .listOfJobs[index].id,
                                                      title: controller
                                                          .listOfJobs[index]
                                                          .title,
                                                      status: controller
                                                          .listOfJobs[index]
                                                          .jobStatus,
                                                      desc: controller
                                                          .listOfJobs[index]
                                                          .description,
                                                      budget: controller
                                                                  .listOfJobs[
                                                                      index]
                                                                  .decidedCost !=
                                                              null
                                                          ? controller
                                                              .listOfJobs[index]
                                                              .decidedCost
                                                              .toString()
                                                          : controller
                                                              .listOfJobs[index]
                                                              .budget,
                                                      date: controller
                                                          .listOfJobs[index]
                                                          .jobDate,
                                                      time: controller
                                                          .listOfJobs[index]
                                                          .jobTime,
                                                      // time: controller.listOfJobs[index].,
                                                      context: context,
                                                    ))),
                                          )
                              ],
                            )
                          ],
                        )),
                      ],
                    );
                  }),
          ),
        ),
      ),
    );
  }
}

Widget shimmerJobList(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.only(
              left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
          children: [
            Column(
              children: [
                // Search bar shimmer
                shimmerBox(width: double.infinity, height: 50.h),
                20.h.verticalSpace,

                // Job cards shimmer list
                Column(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: shimmerBox(width: double.infinity, height: 220.h),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget shimmerBox({required double width, required double height}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
  );
}
