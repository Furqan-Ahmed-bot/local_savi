import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_help_and_feedback_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class PHelpAndFeedbackScreen extends GetWidget<PHelpAndFeedbackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Submit",
            onPress: () {
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
                                  shape: BoxShape.circle,
                                  color: ColorUtils.jobIconBG),
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
                              "Your Feedback has been submitted!",
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
                        SizedBox(
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
            }),
      ),
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Job Details",
          ),
          20.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditText(
                    hintText: "Subject",
                    context: context,
                    bordercolor: Colors.transparent),
                20.h.verticalSpace,
                EditText(
                    hintText: "Type your message here...",
                    minLines: 7,
                    maxLines: 7,
                    context: context,
                    bordercolor: Colors.transparent),
                20.h.verticalSpace,
                SizedBox(
                  width: 1.0.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 0.27.sw,
                            width: 0.27.sw,
                            child: Image.asset(
                              ImageAssets.helpFeedback1,
                              scale: 2,
                            ),
                          ),
                          Positioned(
                              top: 10.h,
                              right: 10.w,
                              child: Image.asset(
                                ImageAssets.helpFeedbackCUt,
                                scale: 2.5,
                              ))
                        ],
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: 0.27.sw,
                            width: 0.27.sw,
                            child: Image.asset(
                              ImageAssets.helpFeedback2,
                              scale: 2,
                            ),
                          ),
                          Positioned(
                              top: 10.h,
                              right: 10.w,
                              child: Image.asset(
                                ImageAssets.helpFeedbackCUt,
                                scale: 2.5,
                              ))
                        ],
                      ),
                      Container(
                        height: 0.27.sw,
                        width: 0.27.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              width: 0.5, color: ColorUtils.borderColor),
                          color: ColorUtils.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageAssets.helpFeedbackAdd,
                              scale: 2,
                            ),
                            Text(
                              "Add More",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ColorUtils.txtLightGrey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
