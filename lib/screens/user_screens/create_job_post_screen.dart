import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/create_job_post_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';

class CreateJobPostScreen extends GetWidget<CreateJobPostScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Continue",
            onPress: () {
              if (controller.stepIndex.value < 3) {
                controller.stepIndex.value = controller.stepIndex.value + 1;
                controller.update();
              }
            }),
      ),
      body: myBackGround(child:
          GetBuilder<CreateJobPostScreenController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              isMenu: false,
              title: "Create Job",
            ),
            20.h.verticalSpace,
            EasyStepper(
              activeStep: controller.stepIndex.value,
              lineStyle: LineStyle(
                // lineLength: 50,
                defaultLineColor: ColorUtils.black,
                activeLineColor: ColorUtils.black,
                lineType: LineType.normal,
                lineThickness: 3,
                lineSpace: 1,
                lineWidth: 10,
                unreachedLineType: LineType.dashed,
              ),
              stepShape: StepShape.circle,
              stepBorderRadius: 15,
              borderThickness: 2,
              internalPadding: 10,
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              stepRadius: 20,
              activeStepBorderColor: ColorUtils.black,
              finishedStepBorderColor: Colors.white,
              finishedStepTextColor: Colors.white,
              finishedStepBackgroundColor: ColorUtils.txtLightGrey,
              activeStepIconColor: Colors.black,
              showLoadingAnimation: false,
              steps: [
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: controller.stepIndex.value >= 0 ? 1 : 0.3,
                      child: Text("1"),
                    ),
                  ),
                  customTitle: Text(
                    'Job Details',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: controller.stepIndex.value >= 0 ? 1 : 0.3,
                      child: Text("2"),
                    ),
                  ),
                  customTitle: Text(
                    'Budget',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: controller.stepIndex.value >= 0 ? 1 : 0.3,
                      child: Text("3"),
                    ),
                  ),
                  customTitle: Text(
                    'Payment',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              onStepReached: (index) => print("------> index: $index"),
            ),
            Expanded(
                child: ListView(
              children: [
                20.verticalSpace,
                Divider(),
                20.verticalSpace,
                controller.stepIndex.value == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          Divider(),
                          20.verticalSpace,
                          Text(
                            "Select Worker Type",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ))
          ],
        );
      })),
    );
  }
}
