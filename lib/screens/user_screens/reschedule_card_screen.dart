import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/reschedule_card_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class RescheduleCardScreen extends GetWidget<RescheduleCardScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Re-Schedule",
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
                              "Your posted job has been re-scheduled!",
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
                        Container(
                          width: 1.0.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.close(3);
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
                                    "View Job Details",
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
        children: [
          appbar(
            isMenu: false,
            title: "Re-Schedule Job",
          ),
          Container(
            width: 1.0.sw,
            margin: EdgeInsets.only(
                bottom: 20.h, left: 20.w, right: 20.w, top: 20.h),
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.6),
                border: Border.all(width: 1.w, color: ColorUtils.borderColor),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Re-Schedule Charges ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "\$ 10.00",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.textColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Payment Method",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                20.verticalSpace,
                Obx(
                  () => InkWell(
                    onTap: () {
                      controller.groupValue.value = 0;
                    },
                    child: Container(
                      width: 1.0.sw,
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.w, color: ColorUtils.borderColor),
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorUtils.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio<int>(
                                value: 0,
                                activeColor: ColorUtils.blue,
                                groupValue: controller.groupValue.value,
                                onChanged: (int? value) {
                                  controller.groupValue.value = value!;
                                },
                              ),
                              20.horizontalSpace,
                              Text(
                                "Wallet",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.w),
                            child: Image.asset(
                              ImageAssets.drawerWallet,
                              scale: 2,
                              color: ColorUtils.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        List.generate(controller.ListOfText.length, (index) {
                      return InkWell(
                        onTap: () {
                          controller.groupValue.value = index + 1;
                        },
                        child: Container(
                          width: 1.0.sw,
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w, color: ColorUtils.borderColor),
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorUtils.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio<int>(
                                    value: index + 1,
                                    activeColor: ColorUtils.blue,
                                    groupValue: controller.groupValue.value,
                                    onChanged: (int? value) {
                                      controller.groupValue.value = value!;
                                    },
                                  ),
                                  20.horizontalSpace,
                                  Text(
                                    controller.ListOfText[index]['title'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.w),
                                child: Image.asset(
                                  controller.ListOfText[index]['image'],
                                  scale: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      ImageAssets.addCircleRed,
                      scale: 2,
                    ),
                    5.horizontalSpace,
                    Text(
                      "Add Card",
                      style: TextStyle(fontSize: 14.sp, color: ColorUtils.red),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
