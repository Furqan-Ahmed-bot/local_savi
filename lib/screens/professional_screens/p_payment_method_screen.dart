// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/payment_method_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class PaymentMethodScreen extends GetWidget<PaymentMethodController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
          child: Column(
        children: [
          appbar(
            isMenu: false,
            title: "Payment Method",
          ),
          30.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Obx(
                  () => InkWell(
                    onTap: () {
                      controller.cardvalue.value = 0;
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
                                groupValue: controller.cardvalue.value,
                                onChanged: (int? value) {
                                  controller.cardvalue.value = value!;
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
                          controller.cardvalue.value = index + 1;
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
                                    groupValue: controller.cardvalue.value,
                                    onChanged: (int? value) {
                                      controller.cardvalue.value = value!;
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
                                  scale: 3.5,
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
