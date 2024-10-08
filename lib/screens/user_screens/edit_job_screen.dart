import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/edit_job_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class EditJobScreen extends GetWidget<EditJobScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Save",
            onPress: () {
              Get.back();
            }),
      ),
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Edit Job",
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            children: [
              Text(
                "Select Worker Type",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              10.verticalSpace,
              Container(
                width: 1.0.sw,
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.groupValue.value = 0;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: controller.groupValue.value == 0
                                  ? ColorUtils.red
                                  : ColorUtils.white,
                            ),
                            child: Row(
                              children: [
                                Radio<int>(
                                  value: 0,
                                  activeColor: ColorUtils.white,
                                  groupValue: controller.groupValue.value,
                                  onChanged: (int? value) {
                                    controller.groupValue.value = value!;
                                  },
                                ),
                                Text(
                                  "Professional",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: controller.groupValue.value == 0
                                          ? ColorUtils.white
                                          : ColorUtils.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.groupValue.value = 1;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: controller.groupValue.value == 1
                                  ? ColorUtils.red
                                  : ColorUtils.white,
                            ),
                            child: Row(
                              children: [
                                Radio<int>(
                                  value: 1,
                                  activeColor: ColorUtils.white,
                                  groupValue: controller.groupValue.value,
                                  onChanged: (int? value) {
                                    controller.groupValue.value = value!;
                                  },
                                ),
                                Text(
                                  "Handyman",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: controller.groupValue.value == 1
                                          ? ColorUtils.white
                                          : ColorUtils.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.verticalSpace,
              Text(
                "Job Title",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black),
              ),
              10.verticalSpace,
              EditText(
                  hintText: "Lorem ipsum dolor sit amet consectetur",
                  context: context,
                  bordercolor: Colors.transparent),
              10.verticalSpace,
              Text(
                "Job Date",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black),
              ),
              10.verticalSpace,
              EditText(
                  ONTAP: () {
                    controller.selectDate(context);
                  },
                  hintText: "06/29/2024",
                  context: context,
                  readonly: true,
                  controller: controller.dateController,
                  suffixIcon: ImageAssets.calendar,
                  bordercolor: Colors.transparent),
              10.verticalSpace,
              Text(
                "Job Time",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black),
              ),
              10.verticalSpace,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EditText(
                        width: 0.26.sw,
                        hintText: "00",
                        context: context,
                        isDropDown: true,
                        suffixIcon: ImageAssets.arrowDown,
                        bordercolor: Colors.transparent),
                    EditText(
                        width: 0.26.sw,
                        hintText: "00",
                        context: context,
                        isDropDown: true,
                        suffixIcon: ImageAssets.arrowDown,
                        bordercolor: Colors.transparent),

                    InkWell(
                      onTap: () {
                        controller.isAm.value = true;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            color: controller.isAm.value
                                ? ColorUtils.blue
                                : ColorUtils.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 1.w,
                                color: controller.isAm.value
                                    ? ColorUtils.blue
                                    : ColorUtils.borderColor)),
                        child: Text(
                          "AM",
                          style: TextStyle(
                              fontSize: 16,
                              color: controller.isAm.value
                                  ? ColorUtils.white
                                  : ColorUtils.black),
                        ),
                      ),
                    ),
                    // 10.horizontalSpace,
                    InkWell(
                      onTap: () {
                        controller.isAm.value = false;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            color: controller.isAm.value
                                ? ColorUtils.white
                                : ColorUtils.blue,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 1.w,
                                color: controller.isAm.value
                                    ? ColorUtils.borderColor
                                    : ColorUtils.blue)),
                        child: Text(
                          "PM",
                          style: TextStyle(
                              fontSize: 16,
                              color: controller.isAm.value
                                  ? ColorUtils.black
                                  : ColorUtils.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              10.verticalSpace,
              Text(
                "Write a job description",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black),
              ),
              10.verticalSpace,
              EditText(
                  hintText:
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt taciti Dolor sit am. Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt taciti Dolor sit am.",
                  context: context,
                  minLines: 5,
                  maxLines: 5,
                  bordercolor: Colors.transparent),
              20.verticalSpace,
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
              ),
              20.verticalSpace,
              Text(
                "Job Location",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black),
              ),
              20.verticalSpace,
              Text(
                "Address",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black),
              ),
              10.verticalSpace,
              EditText(
                  hintText: "Lorem ipsum dolor sit amet consectetur",
                  context: context,
                  bordercolor: Colors.transparent),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "State",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black),
                      ),
                      10.verticalSpace,
                      EditText(
                          width: 0.42.sw,
                          hintText: "State",
                          context: context,
                          isDropDown: true,
                          suffixIcon: ImageAssets.arrowDown,
                          bordercolor: Colors.transparent),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black),
                      ),
                      10.verticalSpace,
                      EditText(
                          width: 0.42.sw,
                          hintText: "City",
                          context: context,
                          isDropDown: true,
                          suffixIcon: ImageAssets.arrowDown,
                          bordercolor: Colors.transparent),
                    ],
                  ),
                ],
              ),
              10.verticalSpace,
              Text(
                "Add Location",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black),
              ),
              10.verticalSpace,
              EditText(
                  hintText: "Lorem ipsum dolor sit amet consectetur",
                  context: context,
                  suffixIcon: ImageAssets.location,
                  bordercolor: Colors.transparent),
              10.verticalSpace,
              Text(
                "Budget",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              10.verticalSpace,
              Text(
                "Job Type",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              10.verticalSpace,
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.fixedAmoount.value = 0;
                  },
                  child: Container(
                    width: 1.0.sw,
                    decoration: BoxDecoration(
                        color: ColorUtils.white,
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                            width: 1.0, color: ColorUtils.borderColor)),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: 0,
                          activeColor: ColorUtils.blue,
                          groupValue: controller.fixedAmoount.value,
                          onChanged: (int? value) {
                            controller.fixedAmoount.value = value!;
                          },
                        ),
                        Text(
                          "Fixed Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: ColorUtils.black),
                        ),
                        Text(
                          " (Pay a fixed amount for the job)",
                          style: TextStyle(
                              fontSize: 13.sp, color: ColorUtils.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.fixedAmoount.value = 1;
                  },
                  child: Container(
                    width: 1.0.sw,
                    decoration: BoxDecoration(
                        color: ColorUtils.white,
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                            width: 1.0, color: ColorUtils.borderColor)),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: 1,
                          activeColor: ColorUtils.blue,
                          groupValue: controller.fixedAmoount.value,
                          onChanged: (int? value) {
                            controller.fixedAmoount.value = value!;
                          },
                        ),
                        Text(
                          "Per Hourly",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: ColorUtils.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Text(
                "Enter Budget",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: ColorUtils.black),
              ),
              10.verticalSpace,
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 60.h,
                      width: 0.2.sw,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorUtils.jobIconBG,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              bottomLeft: Radius.circular(10.r))),
                      child: Text(
                        "USD",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    EditText(
                        width: 0.7.sw,
                        hintText: "Enter Your Budget 0.00",
                        context: context,
                        bordercolor: Colors.transparent),
                  ],
                ),
              ),
              30.verticalSpace,
            ],
          ))
        ],
      )),
    );
  }
}
