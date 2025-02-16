import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/controllers/user_controllers/cancelled_job_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/resources/map/show_map_screen.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class CancelledJobScreen extends GetWidget<CancelledJobScreenController> {
  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Obx(() => controller.isLoading.value
            ? Center(
                child: spinkit,
              )
            : Column(
                children: [
                  appbar(
                    isMenu: false,
                    title: "Job Details",
                  ),
                  GetBuilder<CancelledJobScreenController>(
                      builder: (controller) {
                    return Expanded(
                        child: ListView(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                      children: [
                        20.h.verticalSpace,
                        Text(
                          "Job Cancel Details",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        28.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20.w),
                              child: Text(
                                "Cancellation Status",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Obx(
                              () => Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      controller.isPending.value
                                          ? ImageAssets.pendingIcon
                                          : ImageAssets.cancelIcon,
                                      scale: 2,
                                    ),
                                    6.w.horizontalSpace,
                                    Text(
                                      controller.jobDetailDatail['job_status'],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        12.h.verticalSpace,
                        Divider(
                          color: ColorUtils.borderColor.withOpacity(0.5),
                        ),
                        12.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20.w),
                              child: Text(
                                "Cancellation Date",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                DateFormat("MMM d, yyyy").format(DateTime.parse(
                                    controller.jobDetailDatail['createdAt'])),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        12.h.verticalSpace,
                        Divider(
                          color: ColorUtils.borderColor.withOpacity(0.5),
                        ),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.showCharge.value
                                  ? 12.h.verticalSpace
                                  : 0.h.verticalSpace,
                              controller.showCharge.value
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20.w),
                                          child: Text(
                                            "Cancellation Charged",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "\$ 32.20 (15%)",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : 0.h.verticalSpace,
                              controller.showCharge.value
                                  ? 12.h.verticalSpace
                                  : 0.h.verticalSpace,
                              controller.showCharge.value
                                  ? Divider(
                                      color: ColorUtils.borderColor
                                          .withOpacity(0.5),
                                    )
                                  : 0.h.verticalSpace,
                            ],
                          ),
                        ),
                        20.h.verticalSpace,
                        Text(
                          "Cancellation Reason",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          controller.jobDetailDatail['cancel_job']['reason']
                              ['reason_text'],
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: ColorUtils.textColor),
                        ),
                        12.h.verticalSpace,
                        Divider(
                          color: ColorUtils.borderColor.withOpacity(0.5),
                        ),
                        20.h.verticalSpace,
                        Text(
                          "Job Details",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        12.h.verticalSpace,
                        Divider(
                          color: ColorUtils.borderColor.withOpacity(0.5),
                        ),
                        Text(
                          controller.jobDetailDatail['title'],
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
                                          padding: EdgeInsets.only(right: 10.w),
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
                            Column(
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
                              ],
                            ),
                            Column(
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
                                                decorationColor: ColorUtils.red,
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
                    ));
                  }),
                ],
              )));
  }
}
