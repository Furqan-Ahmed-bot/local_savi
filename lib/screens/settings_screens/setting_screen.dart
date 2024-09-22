import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/setting_controllers/setting_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class SettingScreen extends GetWidget<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  width: 1.0.sw,
                  height: 60.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          width: 0.5.w, color: ColorUtils.borderColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            ImageAssets.settingNotification,
                            scale: 3,
                          ),
                          18.horizontalSpace,
                          Text(
                            "Push Notifications",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: ColorUtils.black,
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => Switch(
                          value: controller.pushNotification.value,
                          inactiveTrackColor: ColorUtils.txtLightGrey,
                          inactiveThumbColor: ColorUtils.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          trackOutlineColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          activeColor: ColorUtils.white,
                          activeTrackColor: ColorUtils.green,
                          onChanged: (bool value) {
                            controller.pushNotification.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                    controller.listofSettings.length,
                    (index) => InkWell(
                      onTap: () {
                        if (controller.listofSettings[index]['route'] != "") {
                          Get.toNamed(
                              controller.listofSettings[index]['route']);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.h),
                        width: 1.0.sw,
                        height: 60.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        decoration: BoxDecoration(
                            color: ColorUtils.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 0.5.w, color: ColorUtils.borderColor)),
                        child: Row(
                          children: [
                            Image.asset(
                              controller.listofSettings[index]['image'],
                              scale: 3,
                            ),
                            18.horizontalSpace,
                            Text(
                              controller.listofSettings[index]['title'],
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: ColorUtils.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
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
                                      ImageAssets.deleteBigIcon,
                                      scale: 2,
                                    ),
                                  ),
                                  20.h.verticalSpace,
                                  Text(
                                    "Delete Account!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorUtils.black,
                                      fontSize: 22.sp,
                                    ),
                                  ),
                                  24.h.verticalSpace,
                                  Text(
                                    "Are your sure you want to delete account?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorUtils.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Container(
                                width: 1.0.sw,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.offAllNamed(
                                              RouteName.selectRoleOne);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.h),
                                          decoration: BoxDecoration(
                                              color: ColorUtils.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                  width: 1.w,
                                                  color:
                                                      ColorUtils.borderColor)),
                                          child: const Text("Yes, Delete"),
                                        ),
                                      ),
                                    ),
                                    20.w.horizontalSpace,
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: ColorUtils.red,
                                          ),
                                          child: Text(
                                            "No",
                                            style: TextStyle(
                                                color: ColorUtils.white),
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
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    width: 1.0.sw,
                    height: 60.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    decoration: BoxDecoration(
                        color: ColorUtils.red,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            width: 0.5.w, color: ColorUtils.borderColor)),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageAssets.settingDelete,
                          scale: 3,
                        ),
                        18.horizontalSpace,
                        Text(
                          "Delete Acocunt",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: ColorUtils.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
