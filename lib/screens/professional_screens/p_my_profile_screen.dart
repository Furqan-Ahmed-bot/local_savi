// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/controllers/professional_controllers/p_my_profile_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

import '../../resources/map/show_map_screen.dart';

class PMyProfileScreen extends GetWidget<PMyProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
          child: Column(
        children: [
          appbar(isMenu: false, title: "My Profile", actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.editProfileScreenPath, arguments: {
                  "data": controller.performerdata,
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 20.w),
                padding: EdgeInsets.all(8.sp),
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
                child: Image.asset(
                  ImageAssets.editIcon,
                  color: ColorUtils.red,
                  scale: 2,
                ),
              ),
            ),
          ]),
          Expanded(
              child: ListView(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 46.h, bottom: 30.h),
            children: [
              GetBuilder<PMyProfileController>(builder: (controller) {
                return controller.isLoading.value
                    ? Center(
                        child: spinkit,
                      )
                    : Column(
                        children: [
                          Stack(
                            children: [
                              controller.performerdata.userDetails!.profilePicture == null
                                  ? Image.asset(
                                      ImageAssets.userProfileImg,
                                      scale: 2,
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: ColorUtils.red, width: 4),
                                      ),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(controller.performerdata.userDetails!.profilePicture ?? ""),
                                      ),
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
                            "${controller.performerdata.userDetails!.firstName} " + "${controller.performerdata.userDetails!.lastName}",
                            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                          ),
                          12.h.verticalSpace,
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteName.pRatingReviewsScreenPath);
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
                                  "(${controller.performerdata.reviews!.averageRatings.toString()})",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                5.w.horizontalSpace,
                                Text(
                                  "Rating",
                                  style: TextStyle(fontSize: 18.sp, decoration: TextDecoration.underline),
                                ),
                                10.w.horizontalSpace,
                                Container(
                                  height: 20.h,
                                  width: 1.w,
                                  color: ColorUtils.borderColor.withOpacity(0.5),
                                ),
                                10.w.horizontalSpace,
                                Text(
                                  "${controller.performerdata.reviews!.ratingCount.toString()}",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                5.w.horizontalSpace,
                                Text(
                                  "Reviews",
                                  style: TextStyle(fontSize: 18.sp, decoration: TextDecoration.underline),
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
                                border: Border.all(width: 1.w, color: ColorUtils.borderColor)),
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    10.verticalSpace,
                                    Container(
                                      height: 200,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                      child: GestureDetector(
                                        onTap: () async {},
                                        child: GoogleMap(
                                          onMapCreated: (controller) {
                                            print("Map created: $controller");
                                            // _controller.complete(controller);
                                          },
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(double.parse(controller.performerdata.userDetails!.latitude.toString()),
                                                double.parse(controller.performerdata.userDetails!.longitude.toString())),
                                            zoom: 5,
                                          ),
                                          onTap: (latLng) async {
                                            LatLng? result = await Get.to(() => ShowMapScreen(
                                                isProfile: true,
                                                initialLocation: LatLng(double.parse(controller.performerdata.userDetails!.latitude.toString()),
                                                    double.parse(controller.performerdata.userDetails!.longitude.toString()))));
                                            // LatLng? result = await
                                            // Get.to(
                                            //   () => ShowMapScreen(
                                            //     isProfile: true,
                                            //     initialLocation: LatLng(3076178580522537, 718024496988206),
                                            //   ),
                                            // );
                                            // if (result != null) {
                                            //   // Get the address from the coordinates using reverse geocoding
                                            //   List<Placemark> placemarks =
                                            //       await placemarkFromCoordinates(
                                            //           result.latitude,
                                            //           result.longitude);
                                            //   if (placemarks.isNotEmpty) {
                                            //     Placemark placemark =
                                            //         placemarks.first;
                                            //     String address =
                                            //         "${placemark.name}, ${placemark.locality}";
                                            //   }
                                            // }
                                          },
                                        ),
                                      ),
                                    ),
                                    10.verticalSpace,
                                  ],
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
                      );
              }),
            ],
          ))
        ],
      )),
    );
  }
}
