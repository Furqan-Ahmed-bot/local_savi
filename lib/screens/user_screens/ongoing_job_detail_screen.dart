import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/controllers/user_controllers/ongoing_job_detail_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/resources/map/show_map_screen.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class OngoingJobDetailScreen
    extends GetWidget<OngoingJobDetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Obx(
      () => controller.isLoading.value
          ? Center(
              child: spinkit,
            )
          : Column(
              children: [
                appbar(isMenu: false, title: "Job Details", actions: [
                  InkWell(
                    onTap: () {
                      controller.isReached.value = true;
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text("Reached",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    ),
                  )
                ]),
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                  children: [
                    20.h.verticalSpace,
                    Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 1.w, color: ColorUtils.borderColor),
                            color: ColorUtils.trakNowbgColor),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      ImageAssets.greenVerifiedIcon,
                                      scale: 2,
                                    ),
                                    10.w.horizontalSpace,
                                    Text(
                                      "${controller.jobDetailDatail['performer']['user_details']['first_name'] + " " + controller.jobDetailDatail['performer']['user_details']['last_name']} On the way",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                controller.isReached.value
                                    ? SizedBox.shrink()
                                    : GestureDetector(
                                        onTap: () {
                                          // Get.back();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.h, horizontal: 20.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: ColorUtils.red,
                                          ),
                                          child: Text(
                                            "Track Now",
                                            style: TextStyle(
                                                color: ColorUtils.white),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                            controller.isReached.value
                                ? 20.h.verticalSpace
                                : 0.h.verticalSpace,
                            controller.isReached.value
                                ? Row(
                                    children: [
                                      30.w.horizontalSpace,
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  insetPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20.w),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  backgroundColor:
                                                      ColorUtils.dialogeBGColor,
                                                  content: SizedBox(
                                                    width: 1.0.sw,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        20.h.verticalSpace,
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  23.sp),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: ColorUtils
                                                                  .jobIconBG),
                                                          child: Image.asset(
                                                            ImageAssets
                                                                .payNowIcon,
                                                            scale: 2,
                                                          ),
                                                        ),
                                                        20.h.verticalSpace,
                                                        Text(
                                                          "Pay Now!",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: ColorUtils
                                                                .black,
                                                            fontSize: 22.sp,
                                                          ),
                                                        ),
                                                        24.h.verticalSpace,
                                                        Text(
                                                          "Are your sure you want to pay?",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: ColorUtils
                                                                .black,
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
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        insetPadding:
                                                                            EdgeInsets.symmetric(horizontal: 20.w),
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        backgroundColor:
                                                                            ColorUtils.dialogeBGColor,
                                                                        content:
                                                                            SizedBox(
                                                                          width:
                                                                              1.0.sw,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              20.h.verticalSpace,
                                                                              Container(
                                                                                padding: EdgeInsets.all(23.sp),
                                                                                decoration: BoxDecoration(shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                                                                                child: Image.asset(
                                                                                  ImageAssets.jobDoneIcon,
                                                                                  scale: 2,
                                                                                ),
                                                                              ),
                                                                              20.h.verticalSpace,
                                                                              Text(
                                                                                "Job Done!",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  color: ColorUtils.black,
                                                                                  fontSize: 22.sp,
                                                                                ),
                                                                              ),
                                                                              24.h.verticalSpace,
                                                                              Text(
                                                                                "Payment transfer successfully!",
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
                                                                            width:
                                                                                1.0.sw,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      Get.close(2);
                                                                                    },
                                                                                    child: Container(
                                                                                      alignment: Alignment.center,
                                                                                      padding: EdgeInsets.symmetric(vertical: 15.h),
                                                                                      decoration: BoxDecoration(color: ColorUtils.white, borderRadius: BorderRadius.circular(10.r), border: Border.all(width: 1.w, color: ColorUtils.borderColor)),
                                                                                      child: const Text("Go back"),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                20.w.horizontalSpace,
                                                                                Expanded(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      Get.close(2);
                                                                                      Get.offAndToNamed(RouteName.rateEmployeeScreenPath);
                                                                                    },
                                                                                    child: Container(
                                                                                      alignment: Alignment.center,
                                                                                      padding: EdgeInsets.symmetric(vertical: 15.h),
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(10.r),
                                                                                        color: ColorUtils.red,
                                                                                      ),
                                                                                      child: Text(
                                                                                        "Rate Employee",
                                                                                        style: TextStyle(color: ColorUtils.white),
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
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            15.h),
                                                                decoration: BoxDecoration(
                                                                    color: ColorUtils
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(10
                                                                            .r),
                                                                    border: Border.all(
                                                                        width:
                                                                            1.w,
                                                                        color: ColorUtils
                                                                            .borderColor)),
                                                                child: const Text(
                                                                    "Yes, Select"),
                                                              ),
                                                            ),
                                                          ),
                                                          20.w.horizontalSpace,
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            15.h),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.r),
                                                                  color:
                                                                      ColorUtils
                                                                          .red,
                                                                ),
                                                                child: Text(
                                                                  "No",
                                                                  style: TextStyle(
                                                                      color: ColorUtils
                                                                          .white),
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
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.h, horizontal: 25.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: ColorUtils.red,
                                          ),
                                          child: Text(
                                            "Pay Now",
                                            style: TextStyle(
                                                color: ColorUtils.white),
                                          ),
                                        ),
                                      ),
                                      10.w.horizontalSpace,
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              RouteName
                                                  .disputePaymentScreenPath,
                                              arguments: {
                                                "jobId": controller.jobId.value
                                              });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.h, horizontal: 25.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: ColorUtils.white,
                                          ),
                                          child: Text(
                                            "Dispute",
                                            style: TextStyle(
                                                color: ColorUtils.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      ),
                    ),
                    20.h.verticalSpace,
                    Text(
                      "Employee",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    12.h.verticalSpace,
                    shortlistUserCard(
                        context: context,
                        name: controller.jobDetailDatail['performer']
                                ['user_details']['first_name'] +
                            " " +
                            controller.jobDetailDatail['performer']
                                ['user_details']['last_name'],
                        rating: "(4.5)",
                        isVerified: true,
                        showSelectJobButton: false,
                        image: controller.jobDetailDatail['performer']
                            ['user_details']['profile_picture']),
                    28.h.verticalSpace,
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Job Details",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.jobDetailDatail['job_status'],
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    color: ColorUtils.blue),
                              ),
                            ],
                          ),
                          13.h.verticalSpace,
                          Divider(
                            color: ColorUtils.borderColor.withOpacity(0.5),
                          ),
                          20.h.verticalSpace,
                          Text(
                            controller.jobDetailDatail['title'] ?? "",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorUtils.black),
                          ),
                          10.h.verticalSpace,
                          Text(
                            controller.jobDetailDatail['description'],
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorUtils.textColor),
                          ),
                          24.h.verticalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      controller
                                          .jobDetailDatail['job_media'].length,
                                      (index) => Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Image.network(
                                                  height: 80,
                                                  width: 80,
                                                  fit: BoxFit.fill,
                                                  controller.jobDetailDatail[
                                                          'job_media'][index]
                                                      ['media_file']),
                                            ),
                                          )),
                                ),
                              ),

                              30.h.verticalSpace,

                              Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // width: 0.3.sw,
                                      margin: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        "Worker Type",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        controller
                                            .jobDetailDatail['worker_type'],
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.h.verticalSpace,
                                Divider(
                                  color:
                                      ColorUtils.borderColor.withOpacity(0.5),
                                ),
                                10.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // width: 0.3.sw,
                                      margin: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        "Job Budget",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        (controller.jobDetailDatail['budget']
                                                    .toString() +
                                                "-" +
                                                controller.jobDetailDatail[
                                                    'budget_type'])
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.h.verticalSpace,
                                Divider(
                                  color:
                                      ColorUtils.borderColor.withOpacity(0.5),
                                ),
                                10.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // width: 0.3.sw,
                                      margin: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        "Job Time",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        DateFormat("HH:mm").format(
                                            DateTime.parse(
                                                controller.jobDetailDatail[
                                                    'start_time'])),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.h.verticalSpace,
                                Divider(
                                  color:
                                      ColorUtils.borderColor.withOpacity(0.5),
                                ),
                                10.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // width: 0.3.sw,
                                      margin: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        "Job Date",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        DateFormat("MMM d, yyyy").format(
                                            DateTime.parse(controller
                                                .jobDetailDatail['job_date'])),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.h.verticalSpace,
                                Divider(
                                  color:
                                      ColorUtils.borderColor.withOpacity(0.5),
                                ),
                                10.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // width: 0.3.sw,
                                      margin: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        "Job Address",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        controller.jobDetailDatail['address'],
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.h.verticalSpace,
                                Divider(
                                  color:
                                      ColorUtils.borderColor.withOpacity(0.5),
                                ),
                                10.h.verticalSpace,
                              ]),
                              // Column(
                              //   children: List.generate(
                              //     controller.dummyData.length,
                              //     (index) => Column(
                              //       // mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceBetween,
                              //           crossAxisAlignment: CrossAxisAlignment.start,
                              //           children: [
                              //             Container(
                              //               // width: 0.3.sw,
                              //               margin: EdgeInsets.only(right: 20.w),
                              //               child: Text(
                              //                 controller.dummyData[index]['title'],
                              //                 style: TextStyle(
                              //                   fontSize: 16.sp,
                              //                   fontWeight: FontWeight.w600,
                              //                 ),
                              //               ),
                              //             ),
                              //             Flexible(
                              //               child: Text(
                              //                 controller.dummyData[index]["value"],
                              //                 style: TextStyle(
                              //                   fontSize: 16.sp,
                              //                   fontWeight: FontWeight.w500,
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         16.h.verticalSpace,
                              //         Divider(
                              //           color:
                              //               ColorUtils.borderColor.withOpacity(0.5),
                              //         ),
                              //         16.h.verticalSpace,
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 0.3.sw,
                                        margin: EdgeInsets.only(right: 20.w),
                                        child: Text(
                                          "Job Location",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            controller
                                                .jobDetailDatail['location'],
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          5.w.horizontalSpace,
                                          InkWell(
                                            onTap: () async {
                                              String address = '';
                                              List<Placemark> placemarks =
                                                  await placemarkFromCoordinates(
                                                      double.parse(controller
                                                              .jobDetailDatail[
                                                          'latitude']),
                                                      double.parse(
                                                        controller
                                                                .jobDetailDatail[
                                                            'longitude'],
                                                      ));

                                              if (placemarks.isNotEmpty) {
                                                Placemark place = placemarks[0];
                                                address =
                                                    '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
                                                print("Address: $address");

                                                // You can display the address in a dialog, snackbar, or any widget
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'Selected Location: $address')),
                                                );
                                              }

                                              Get.to(() => ShowMapScreen(
                                                    address: address,
                                                    isProfile: true,
                                                    initialLocation: LatLng(
                                                        double.parse(controller
                                                                .jobDetailDatail[
                                                            'latitude']),
                                                        double.parse(controller
                                                                .jobDetailDatail[
                                                            'longitude'])),
                                                  ));
                                            },
                                            child: Text(
                                              "(View Map)",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: ColorUtils.red,
                                                  decorationColor:
                                                      ColorUtils.red,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  30.h.verticalSpace
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              ],
            ),
    ));
  }
}
