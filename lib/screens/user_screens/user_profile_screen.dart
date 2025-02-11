// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/controllers/user_controllers/user_profile_screen_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/resources/map/show_map_screen.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../resources/map/map_screen.dart';

class UserProfileScreen extends GetWidget<UserProfileScreenController> {
  Set<Circle> circles = {};
  final Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;

  @override
  Widget build(BuildContext context) {
    return myBackGround(
        child: Column(
      children: [
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 46.h, bottom: 110.h),
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: spinkit,
                    )
                  : GetBuilder<UserProfileScreenController>(builder: (controller) {
                      return Column(
                        children: [
                          controller.userdata.userDetails!.profilePicture == null
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
                                    backgroundImage: NetworkImage(controller.userdata.userDetails!.profilePicture ?? ""),
                                  ),
                                ),
                          16.h.verticalSpace,
                          Text(
                            "${controller.userdata.userDetails!.firstName.toString().capitalizeFirst ?? ""} ${controller.userdata.userDetails!.lastName.toString().capitalizeFirst ?? ""}",
                            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
                                border: Border.all(width: 1.w, color: ColorUtils.borderColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: List.generate(
                                    controller.userData.length,
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
                                                controller.userData[index]['title'],
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                controller.userData[index]["value"],
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
                                // Image.asset(
                                //   ImageAssets.mapimg,
                                //   // scale: 2,
                                // ),
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
                                            target: LatLng(0.3076178580522537, 5.718024496988206),
                                            zoom: 5,
                                          ),
                                          onTap: (latLng) async {
                                            LatLng? result =
                                                await Get.to(() => MapScreen(initialLocation: LatLng(0.3076178580522537, 5.718024496988206)));
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
                                          markers: Set<Marker>.from([
                                            // if (LatLng( 0.3076178580522537,  5.718024496988206) !=
                                            //     null)
                                            Marker(
                                              markerId: MarkerId('selected_location'),
                                              position: LatLng(0.3076178580522537, 5.718024496988206),
                                            ),
                                          ]),
                                          circles: circles,
                                          myLocationEnabled: true,
                                          myLocationButtonEnabled: false,
                                          zoomControlsEnabled: true,
                                        ),
                                      ),
                                    ),
                                    10.verticalSpace,
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
            ),
          ],
        ))
      ],
    ));
  }
}
