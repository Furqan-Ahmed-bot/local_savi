import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/setting_controllers/change_pass_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class ChangePassScreen extends GetWidget<ChangePassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Change Now",
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
            title: "Settings",
          ),
          20.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Password",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black),
                ),
                10.verticalSpace,
                Obx(
                  () => EditText(
                    obscure: controller.isCurrentPassVisile.value,
                    suffixClick: () {
                      controller.isCurrentPassVisile.value =
                          !controller.isCurrentPassVisile.value;
                    },
                    isPassword: true,
                    hintText: "Current Password",
                    prefixIcon: ImageAssets.lockIcon,
                    context: context,
                    bordercolor: Colors.transparent,
                  ),
                ),
                10.verticalSpace,
                Text(
                  "New Password",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black),
                ),
                10.verticalSpace,
                Obx(
                  () => EditText(
                    obscure: controller.isNewPassVisile.value,
                    suffixClick: () {
                      controller.isNewPassVisile.value =
                          !controller.isNewPassVisile.value;
                    },
                    isPassword: true,
                    hintText: "New Password",
                    prefixIcon: ImageAssets.lockIcon,
                    context: context,
                    bordercolor: Colors.transparent,
                  ),
                ),
                10.verticalSpace,
                Text(
                  "Confirm New Password",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black),
                ),
                10.verticalSpace,
                Obx(
                  () => EditText(
                    obscure: controller.isConfirmPassVisile.value,
                    suffixClick: () {
                      controller.isConfirmPassVisile.value =
                          !controller.isConfirmPassVisile.value;
                    },
                    isPassword: true,
                    hintText: "Confirm New Password",
                    prefixIcon: ImageAssets.lockIcon,
                    context: context,
                    bordercolor: Colors.transparent,
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ],
      )),
    );
  }
}
