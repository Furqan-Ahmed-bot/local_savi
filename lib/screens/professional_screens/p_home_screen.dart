import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_home_controller.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PHomeScreen extends GetWidget<PHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
        child: Obx(
          () => controller.isLaoding.value
              ? Center(
                  child: spinkit,
                )
              : GetBuilder(
                  init: controller,
                  builder: (controller) {
                    return Column(
                      children: [
                        Expanded(
                            child: ListView(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
                          children: [
                            Column(
                              children: [
                                EditText(
                                  hintText: "Search",
                                  context: context,
                                  suffixIcon: ImageAssets.filterIcon,
                                  suffixClick: () {
                                    Get.toNamed(RouteName.psearchFilterScreenPath);
                                  },
                                  bordercolor: Colors.transparent,
                                ),
                                20.h.verticalSpace,
                                controller.listOfJobs.isEmpty
                                    ? const Center(child: Center(child: Text("No Jobs Available")))
                                    : Column(
                                        children: List.generate(
                                            controller.listOfJobs.length,
                                            (index) => InkWell(
                                                onTap: () {
                                                  Get.toNamed(RouteName.pJobsDetailScreenPath, arguments: {
                                                    "showBottomButton": true,
                                                    "status": "Job Open",
                                                    "showActionButton": true,
                                                    "bottomButtonText": "Apply Now"
                                                  });
                                                },
                                                child: applyJobCard(
                                                  id: controller.listOfJobs[index].id,
                                                  title: controller.listOfJobs[index].title,
                                                  status: controller.listOfJobs[index].jobStatus,
                                                  desc: controller.listOfJobs[index].description,
                                                  budget: controller.listOfJobs[index].budget,
                                                  date: controller.listOfJobs[index].jobDate,
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
    );
  }
}
