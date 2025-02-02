import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_saved_jobs_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PSavedJobsScreen extends GetWidget<PSavedJobsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
        child: GetBuilder<PSavedJobsController>(builder: (controller) {
          return Column(
            children: [
              Expanded(
                  child: ListView(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
                children: [
                  controller.isLoading.value
                      ? Center(
                          child: spinkit,
                        )
                      : Column(
                          children: [
                            // 20.h.verticalSpace,
                            controller.listOfBookMark.isEmpty
                                ? Text("No Saved jobs available!")
                                : Column(
                                    children: List.generate(
                                        controller.listOfBookMark.length,
                                        (index) => InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  RouteName
                                                      .pJobsDetailScreenPath,
                                                  arguments: {
                                                    "showBottomButton": true,
                                                    "status": "Job Open",
                                                    "showActionButton": true,
                                                    "bottomButtonText":
                                                        "Apply Now",
                                                    "jobId": controller
                                                        .listOfBookMark[index]
                                                        .jobs!
                                                        .id,
                                                  });
                                            },
                                            child: applyJobCard(
                                                id: controller
                                                    .listOfBookMark[index]
                                                    .jobs!
                                                    .id,
                                                time: controller
                                                    .listOfBookMark[index]
                                                    .jobs!
                                                    .startTime,
                                                title: controller
                                                    .listOfBookMark[index]
                                                    .jobs!
                                                    .title,
                                                status: controller
                                                    .listOfBookMark[index]
                                                    .jobs!
                                                    .jobStatus,
                                                desc: controller
                                                    .listOfBookMark[index]
                                                    .jobs!
                                                    .description,
                                                budget: controller
                                                    .listOfBookMark[index]
                                                    .jobs!
                                                    .budget,
                                                date: controller
                                                    .listOfBookMark[index]
                                                    .jobs!
                                                    .jobDate,
                                                context: context))),
                                  )
                          ],
                        )
                ],
              )),
            ],
          );
        }),
      ),
    );
  }
}
