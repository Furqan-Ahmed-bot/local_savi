import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/best_performer_detail_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class BestPerformerDetailScreen
    extends GetWidget<BestPerformerDetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        Obx(
          () => appbar(isMenu: false, title: controller.title.value, actions: [
            controller.showChat.value
                ? GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.chatScreenPath,
                          arguments: {"showUserDetail": false});
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.w),
                      padding: EdgeInsets.all(8.sp),
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorUtils.appbarButtonBG),
                      child: Image.asset(
                        ImageAssets.msgIcon,
                        color: ColorUtils.red,
                        scale: 2,
                      ),
                    ),
                  )
                : SizedBox(
                    width: 50.w,
                  ),
          ]),
        ),
        Expanded(
            child: ListView(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 46.h, bottom: 30.h),
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      ImageAssets.oliverDetailImg,
                      scale: 2,
                    ),
                    Positioned(
                        right: 0,
                        child: Image.asset(
                          ImageAssets.verifiedBigIcon,
                          scale: 2,
                        ))
                  ],
                ),
                16.h.verticalSpace,
                Text(
                  "Oliver Mark",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                12.h.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.ratingAndReviewsScreenPath);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.starIcon,
                        scale: 2,
                      ),
                      10.w.horizontalSpace,
                      Text(
                        "(4.5)",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      5.w.horizontalSpace,
                      Text(
                        "Rating",
                        style: TextStyle(
                            fontSize: 18.sp,
                            decoration: TextDecoration.underline),
                      ),
                      10.w.horizontalSpace,
                      Container(
                        height: 20.h,
                        width: 1.w,
                        color: ColorUtils.borderColor.withOpacity(0.5),
                      ),
                      10.w.horizontalSpace,
                      Text(
                        "126",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      5.w.horizontalSpace,
                      Text(
                        "Reviews",
                        style: TextStyle(
                            fontSize: 18.sp,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
                15.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Divider(
                    color: ColorUtils.black.withOpacity(0.3),
                  ),
                ),
                16.h.verticalSpace,
                Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: ColorUtils.white,
                      border: Border.all(
                          width: 1.w, color: ColorUtils.borderColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: List.generate(
                          controller.dummyData.length,
                          (index) => Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 0.3.sw,
                                    margin: EdgeInsets.only(right: 20.w),
                                    child: Text(
                                      controller.dummyData[index]['title'],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller.dummyData[index]["value"],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              16.h.verticalSpace,
                              Divider(
                                color: ColorUtils.borderColor.withOpacity(0.5),
                              ),
                              16.h.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.h.verticalSpace,
                      Image.asset(
                        ImageAssets.mapimg,
                        // scale: 2,
                      ),
                      10.h.verticalSpace,
                      Text(
                        "Professional Documents",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            ImageAssets.oliverCertificateImg,
                            scale: 2,
                          ),
                          Image.asset(
                            ImageAssets.oliverCertificateImg,
                            scale: 2,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ))
      ],
    ));
  }
}
