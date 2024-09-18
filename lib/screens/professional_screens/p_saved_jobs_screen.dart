import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_saved_jobs_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PSavedJobsScreen extends GetWidget<PSavedJobsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
              children: [
                Column(
                  children: [
                    // 20.h.verticalSpace,
                    Column(
                      children: List.generate(
                          2,
                          (index) => InkWell(
                              onTap: () {
                                Get.toNamed(RouteName.pJobsDetailScreenPath,
                                    arguments: {
                                      "showBottomButton": true,
                                      "status": "Job Open",
                                      "showActionButton": true,
                                      "bottomButtonText": "Apply Now"
                                    });
                              },
                              child: applyJobCard(context: context))),
                    )
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
