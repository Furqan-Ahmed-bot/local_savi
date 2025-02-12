import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_search_result_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';

import '../../controllers/professional_controllers/p_filter_controller.dart';

class PSearchResultScreen extends GetWidget<PSearchResultController> {
  final filterrController = Get.put(PFilterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              isMenu: false,
              title: "Search Result",
            ),
            20.verticalSpace,
            Expanded(
                child: Obx(
              () => ListView(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
                children: [
                  filterrController.isLoading.value
                      ? Center(
                          child: spinkit,
                        )
                      : filterrController.filteredJobs.isEmpty
                          ? Center(
                              child: Text('No Jobs Found'),
                            )
                          : Column(
                              children: [
                                // 20.h.verticalSpace,
                                Column(
                                  children: List.generate(
                                      filterrController.filteredJobs.length,
                                      (index) => InkWell(
                                          onTap: () {
                                            Get.toNamed(RouteName.pJobsDetailScreenPath, arguments: {
                                              "showBottomButton": true,
                                              "status": "Job Open",
                                              "showActionButton": true,
                                              "bottomButtonText": "Apply Now",
                                              "jobId": filterrController.filteredJobs[index]['id']
                                            });
                                          },
                                          child: applyJobCard(
                                              context: context,
                                              title: filterrController.filteredJobs[index]['title'],
                                              desc: filterrController.filteredJobs[index]['description'],
                                              budget: filterrController.filteredJobs[index]['budget'].toString(),
                                              date: filterrController.filteredJobs[index]['job_date'],
                                              time: filterrController.filteredJobs[index]['start_time']))),
                                )
                              ],
                            )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
