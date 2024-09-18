import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_cancel_job_reason_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class PCancelJobReasonScreen extends GetWidget<PCancelJobReasonController> {
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
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.w600),
                            ),
                            12.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "Your job cancellation request has been sent to admin. Please wait for further process",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Container(
                          width: 1.0.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.close(3);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.h),
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
                Text(
                  "Select Reason",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(5, (index) {
                      return InkWell(
                        onTap: () {
                          controller.groupValue.value = index;
                        },
                        child: ListTile(
                          horizontalTitleGap: 0,
                          title: Text(
                            controller.ListOfText[index],
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          leading: Radio<int>(
                            value: index,
                            activeColor: ColorUtils.blue,
                            groupValue: controller.groupValue.value,
                            onChanged: (int? value) {
                              controller.groupValue.value = value!;
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                20.h.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorUtils.white,
                    border:
                        Border.all(width: 1.0.w, color: ColorUtils.borderColor),
                  ),
                  child: TextField(
                    maxLines: 5,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Write a reaason",
                      hintStyle: TextStyle(color: ColorUtils.grey),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 0.051.sw, vertical: 0.016.sh),
                    ),
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
