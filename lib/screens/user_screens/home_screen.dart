// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/home_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/api_services/user_services.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 110.h),
              children: [
                Obx(
                  () => controller.isLoading.value
                      ? Center(
                          child: spinkit,
                        )
                      : GetBuilder<HomeScreenController>(
                          init: controller,
                          builder: (_) {
                            return Column(
                              children: [
                                34.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 0.7.sw,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              UserServices.instance
                                                  .getProfileService(
                                                      context: context);
                                            },
                                            child: Text(
                                              "Hello, ${controller.userdata.userDetails!.firstName}",
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 31.sp,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "How are you doing today?",
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    controller.userdata.userDetails!
                                                .profilePicture ==
                                            null
                                        ? Image.asset(
                                            ImageAssets.userProfileImg,
                                            scale: 2,
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundImage: NetworkImage(
                                                  controller
                                                          .userdata
                                                          .userDetails!
                                                          .profilePicture ??
                                                      ""),
                                            ),
                                          ),
                                  ],
                                ),
                                16.h.verticalSpace,
                                Divider(
                                  color: ColorUtils.borderColor,
                                ),
                                16.h.verticalSpace,
                                Container(
                                  width: 1.0.sw,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        ImageAssets.featuresImg,
                                        // scale: 2,
                                      ),
                                      Positioned(
                                        right: 10.w,
                                        top: 10.h,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 6.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: ColorUtils.white,
                                            border: Border.all(
                                                width: 1.w,
                                                color: ColorUtils.borderColor),
                                          ),
                                          child: Text(
                                            "Feature Ads",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                20.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Best Performers",
                                      style: TextStyle(
                                        // fontFamily: Font.SemiBold,
                                        color: ColorUtils.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RouteName.bestPerformerScreenPath);
                                      },
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                            color: ColorUtils.red,
                                            fontSize: 14.sp,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: ColorUtils.red,
                                            decorationThickness: 2.h),
                                      ),
                                    ),
                                  ],
                                ),
                                16.h.verticalSpace,
                                Obx(
                                  () => Container(
                                    width: 1.0.sw,
                                    child: controller.issecondaryLoading.value
                                        ? shimmerEffect(context)
                                        : controller.bestPerformers.isEmpty
                                            ? Text(
                                                "No Best Performers Available!")
                                            : Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: List.generate(
                                                    3,
                                                    (index) => Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  RouteName
                                                                      .bestPerformerDetailScreenPath,
                                                                  arguments: {
                                                                    "id": controller
                                                                            .bestPerformers[
                                                                        index]['id'],
                                                                    "title":
                                                                        "Best Performer",
                                                                    "showChat":
                                                                        true,
                                                                  });
                                                            },
                                                            child: Container(
                                                              width: 0.25.sw,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          12.w),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          15.sp),
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      ColorUtils
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(10
                                                                              .sp),
                                                                  border: Border.all(
                                                                      width:
                                                                          1.w,
                                                                      color: ColorUtils
                                                                          .borderColor)),
                                                              child: Column(
                                                                children: [
                                                                  15.h.verticalSpace,
                                                                  SizedBox(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child:
                                                                        ClipOval(
                                                                      child: Image
                                                                          .network(
                                                                        loadingBuilder: (context,
                                                                            child,
                                                                            loadingProgress) {
                                                                          if (loadingProgress ==
                                                                              null)
                                                                            return child;
                                                                          return const Center(
                                                                            child:
                                                                                CircularProgressIndicator(),
                                                                          );
                                                                        },
                                                                        errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) {
                                                                          return const Center(
                                                                            child:
                                                                                CircularProgressIndicator(),
                                                                          );
                                                                        },
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        controller.bestPerformers[index]
                                                                            [
                                                                            'profile_picture'],
                                                                        scale:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  // ClipRRect(
                                                                  //   borderRadius:
                                                                  //       BorderRadius.circular(
                                                                  //           50.r),
                                                                  //   child:
                                                                  //       Container(
                                                                  //     decoration: BoxDecoration(
                                                                  //         shape:
                                                                  //             BoxShape.circle,
                                                                  //         border: Border.all(width: 1.w, color: ColorUtils.borderColor)),
                                                                  //     child: Image
                                                                  //         .asset(
                                                                  //       controller.dummyData[index]
                                                                  //           [
                                                                  //           'image'],
                                                                  //       scale:
                                                                  //           2,
                                                                  //     ),
                                                                  //   ),
                                                                  // ),
                                                                  10.h.verticalSpace,
                                                                  Text(
                                                                    controller.bestPerformers[
                                                                            index]
                                                                        [
                                                                        'first_name'],
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            16.sp),
                                                                  ),
                                                                  5.h.verticalSpace,
                                                                  Text(
                                                                    "United States",
                                                                    style: TextStyle(
                                                                        fontSize: 16
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                  8.h.verticalSpace,
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        ImageAssets
                                                                            .starIcon,
                                                                        scale:
                                                                            2,
                                                                      ),
                                                                      7.w.horizontalSpace,
                                                                      Text(
                                                                        (controller.bestPerformers[index]['average_ratings'] ??
                                                                                0)
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                              ),
                                  ),
                                ),
                                20.h.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Acctive Jobs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: ColorUtils.black),
                                    ),
                                    6.w.horizontalSpace,
                                    Text(
                                      "(${controller.listOfActiveJobs.length})",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: ColorUtils.black),
                                    ),
                                  ],
                                ),
                                16.h.verticalSpace,
                                Column(
                                  children: List.generate(
                                      controller.listOfActiveJobs.length,
                                      (index) => GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                RouteName.jobPostedScreenPath,
                                                arguments: {
                                                  "jobId": controller
                                                          .listOfActiveJobs[
                                                      index]['id']
                                                });
                                          },
                                          child: activeJobCard(
                                              title: controller
                                                      .listOfActiveJobs[index]
                                                  ['title'],
                                              desc: controller.listOfActiveJobs[index]
                                                  ['description'],
                                              budget: controller
                                                  .listOfActiveJobs[index]
                                                      ['budget']
                                                  .toString(),
                                              date: controller.listOfActiveJobs[index]
                                                  ['job_date'],
                                              time: controller
                                                      .listOfActiveJobs[index]
                                                  ['start_time'],
                                              workerType:
                                                  controller.listOfActiveJobs[index]
                                                      ['worker_type']
                                              // status: controller.names[
                                              //     controller
                                              //         .selectedIndex.value]
                                              ))),
                                )
                              ],
                            );
                          }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget shimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: Container(
              width: 0.25 * MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 80,
                    height: 16,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                      SizedBox(width: 7),
                      Container(
                        width: 30,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
