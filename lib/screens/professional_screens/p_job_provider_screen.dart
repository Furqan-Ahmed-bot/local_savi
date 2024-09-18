import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_job_provider_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class PJobProviderScreen extends GetWidget<PJobProvidercontroller> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        appbar(isMenu: false, title: "Job Provider profile"),
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(
              left: 20.w, right: 20.w, top: 46.h, bottom: 110.h),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    ImageAssets.userProfileImg,
                    scale: 2,
                  ),
                ),
                16.h.verticalSpace,
                Center(
                  child: Text(
                    "John Smith",
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                16.h.verticalSpace,
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
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
                              controller.dummyData.length - 1 == index
                                  ? 0.h.verticalSpace
                                  : 12.h.verticalSpace,
                              controller.dummyData.length - 1 == index
                                  ? 0.h.verticalSpace
                                  : Divider(
                                      color: ColorUtils.borderColor
                                          .withOpacity(0.5),
                                    ),
                              12.h.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                12.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Active Jobs ",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "(2)",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorUtils.txtGreyDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Column(
                  children: List.generate(
                      2,
                      (index) => InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.pJobsDetailScreenPath,
                                arguments: {
                                  "showBottomButton": true,
                                  "status": "Job Open",
                                  "showActionButton": true,
                                  "bottomButtonText": "Apply Now"
                                });
                          },
                          child: applyJobCard(context: context))),
                )
              ],
            ),
          ],
        ))
      ],
    ));
  }
}
