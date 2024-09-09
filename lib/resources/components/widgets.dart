import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

Widget activeJobCard() {
  return Container(
    width: 1.0.sw,
    margin: EdgeInsets.only(bottom: 16.h),
    padding: EdgeInsets.all(10.sp),
    decoration: BoxDecoration(
      color: ColorUtils.white,
      border: Border.all(width: 1.w, color: ColorUtils.borderColor),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 0.43.sw,
              child: Text(
                "Lorem ipsum dolor sit...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Text(
              "For Professional | July 20",
              style: TextStyle(fontSize: 12.sp, color: ColorUtils.borderColor),
            )
          ],
        ),
        6.h.verticalSpace,
        Text('Lorem ipsum dolor sit amet consectetur adipiscing elit odio.'),
        12.h.verticalSpace,
        Divider(
          color: ColorUtils.borderColor.withOpacity(0.5),
        ),
        12.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Budget",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  "\$50.00",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 1.w,
              decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Time",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  "03:00 pm",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 1.w,
              decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Date",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  "May 18, 2024",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget myBackGround({
  required Widget child,
  Widget? bottomNavBar,
}) {
  return Scaffold(
    extendBody: true,
    bottomNavigationBar: Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 25.h, left: 16.w, right: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [bottomNavBar ?? const SizedBox()],
      ),
    ),
    body: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorUtils.primary, // Light blue shade for the top
            ColorUtils.white, // White shade for the bottom
          ],
        ),
      ),
      child: child,
    ),
  );
}

Widget appbar({
  required bool isMenu,
  required String title,
  List<Widget>? actions,
}) {
  return Container(
    margin: EdgeInsets.only(top: 60.h),
    width: 1.0.sw,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isMenu
            ? Container(
                margin: EdgeInsets.only(left: 20.w),
                padding: EdgeInsets.all(8.sp),
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
                child: Image.asset(
                  ImageAssets.menunicon,
                  scale: 2,
                ),
              )
            : Container(
                margin: EdgeInsets.only(left: 20.w),
                padding: EdgeInsets.all(8.sp),
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
                child: Image.asset(
                  ImageAssets.backArrow,
                  scale: 2,
                ),
              ),
        title != ""
            ? Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              )
            : Image.asset(
                ImageAssets.logoSamll,
                scale: 2,
              ),
        Row(
          children: actions ??
              [
                Container(
                  width: 80.w,
                )
              ],
        )
      ],
    ),
  );
}
