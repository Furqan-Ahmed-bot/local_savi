import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_cancel_job_reason_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';

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
            controller.cancelJob();
          },
        ),
      ),
      body: myBackGround(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              isMenu: false,
              title: "Job Details",
            ),
            20.h.verticalSpace,
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: spinkit,
                    )
                  : Padding(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  controller.groupValue.value = index;
                                },
                                child: ListTile(
                                  horizontalTitleGap: 0,
                                  title: Text(
                                    controller.ListOfText[index]['reason_text'],
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
                          20.h.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorUtils.white,
                              border: Border.all(
                                  width: 1.0.w, color: ColorUtils.borderColor),
                            ),
                            child: TextField(
                              maxLines: 5,
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
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
            ),
          ],
        ),
      )),
    );
  }
}
