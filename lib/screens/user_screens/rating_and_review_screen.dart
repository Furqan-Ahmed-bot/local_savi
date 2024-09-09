import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/rating_and_review_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class RatingAndReviewScreen extends GetWidget<RatingAndReviewScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        appbar(
          isMenu: false,
          title: "Rating & Reviews",
        ),
        28.h.verticalSpace,
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: ColorUtils.borderColor),
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorUtils.white,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(17.sp),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 2.w, color: ColorUtils.black),
                          shape: BoxShape.circle,
                          color: ColorUtils.white),
                      child: Image.asset(
                        ImageAssets.verifiedIconOnly,
                        scale: 2,
                      ),
                    ),
                    35.w.horizontalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              "4.5",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50.sp,
                              ),
                            ),
                            10.w.horizontalSpace,
                            Text(
                              "Overall Rating",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        18.h.verticalSpace,
                        Row(
                          children: [
                            Image.asset(
                              ImageAssets.starRatingIcon,
                              scale: 2,
                            ),
                            8.w.horizontalSpace,
                            Image.asset(
                              ImageAssets.starRatingIcon,
                              scale: 2,
                            ),
                            8.w.horizontalSpace,
                            Image.asset(
                              ImageAssets.starRatingIcon,
                              scale: 2,
                            ),
                            8.w.horizontalSpace,
                            Image.asset(
                              ImageAssets.starRatingIcon,
                              scale: 2,
                            ),
                            8.w.horizontalSpace,
                            Image.asset(
                              ImageAssets.starOutlineIcon,
                              scale: 2,
                            ),
                            8.w.horizontalSpace,
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              30.h.verticalSpace,
              Text(
                "Reviews (65)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              12.h.verticalSpace,
              Divider(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
              16.h.verticalSpace,
              Column(
                children: List.generate(
                    controller.dummyData.length,
                    (index) => ratingReviewCard(
                        image: controller.dummyData[index]['image'],
                        name: controller.dummyData[index]['name'],
                        dateTime: controller.dummyData[index]['dateTime'],
                        desc: controller.dummyData[index]['desc'],
                        isReply: controller.dummyData[index]['isReply'])),
              )
            ],
          ),
        )
      ],
    ));
  }
}
