import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/reschedule_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class RescheduleScreen extends GetWidget<RescheduleScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Continue",
            onPress: () {
              Get.toNamed(RouteName.rescheduleCardsScreenPath);
            }),
      ),
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Re-Schedule Job",
          ),
          Container(
            padding: EdgeInsets.all(15.sp),
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
            width: 1.0.sw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: 1.w,
                  color: ColorUtils.borderColor.withOpacity(0.5),
                ),
                color: ColorUtils.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Job Details",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      "July 20",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.borderColor),
                    ),
                  ],
                ),
                5.verticalSpace,
                Text(
                  "Lorem ipsum dolor sit amet consectetur adipiscing elit odio.",
                  style:
                      TextStyle(fontSize: 16.sp, color: ColorUtils.textColor),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Container(
            width: 1.0.sw,
            margin: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.6),
                border: Border.all(width: 1.w, color: ColorUtils.borderColor),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Note: ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Flexible(
                  child: Text(
                    "\$10 charges for re-schedule your job",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: ColorUtils.textColor),
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Date",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black),
                ),
                10.verticalSpace,
                EditText(
                    hintText: "06/29/2024",
                    context: context,
                    readonly: true,
                    ONTAP: () {
                      controller.selectDate(context);
                    },
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
              ],
            ),
          )
        ],
      )),
    );
  }
}
