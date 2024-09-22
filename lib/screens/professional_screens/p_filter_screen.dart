import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_filter_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PFilterScreen extends GetWidget<PFilterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Apply",
            onPress: () {
              Get.toNamed(RouteName.psearchResultScreenPath);
            }),
      ),
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Search Filter",
          ),
          20.verticalSpace,
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Search Keyword",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    EditText(
                        hintText: "Search here",
                        context: context,
                        bordercolor: Colors.transparent),
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
                        hintText: "06/29/2024",
                        context: context,
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
                      "Add location",
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
                      "Set Distance",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    Container(
                      width: 1.0.sw,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: ColorUtils.textColor),
                              ),
                              Text(
                                "Miles",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: ColorUtils.textColor),
                              ),
                            ],
                          ),
                          Obx(
                            () => Expanded(
                              child: RangeSlider(
                                  values: RangeValues(
                                      controller.startDistance.value,
                                      controller.endDistance.value),
                                  min: 10,
                                  max: 80,
                                  activeColor: ColorUtils.black,
                                  inactiveColor: ColorUtils.txtLightGrey,
                                  divisions: 10,
                                  labels: RangeLabels(
                                      controller.startDistance.value
                                          .round()
                                          .toString(),
                                      controller.endDistance.value
                                          .round()
                                          .toString()),
                                  onChanged: (value) {
                                    controller.startDistance.value =
                                        value.start;
                                    controller.endDistance.value = value.end;
                                  }),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "80",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: ColorUtils.textColor),
                              ),
                              Text(
                                "Miles",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: ColorUtils.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Set Budget",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    Container(
                      width: 1.0.sw,
                      child: Row(
                        children: [
                          Text(
                            "\$100",
                            style: TextStyle(
                                fontSize: 13.sp, color: ColorUtils.textColor),
                          ),
                          Obx(
                            () => Expanded(
                              child: RangeSlider(
                                  values: RangeValues(
                                      controller.startPrice.value,
                                      controller.endPrice.value),
                                  min: 100,
                                  max: 350,
                                  activeColor: ColorUtils.black,
                                  inactiveColor: ColorUtils.txtLightGrey,
                                  divisions: 20,
                                  labels: RangeLabels(
                                      controller.startPrice.value
                                          .round()
                                          .toString(),
                                      controller.endPrice.value
                                          .round()
                                          .toString()),
                                  onChanged: (value) {
                                    controller.startPrice.value = value.start;
                                    controller.endPrice.value = value.end;
                                  }),
                            ),
                          ),
                          Text(
                            "\$350",
                            style: TextStyle(
                                fontSize: 13.sp, color: ColorUtils.textColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
