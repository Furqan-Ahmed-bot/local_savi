// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/controllers/professional_controllers/p_filter_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import '../../resources/map/map_screen.dart';
import '../../utils/routes/routes.dart';

class PFilterScreen extends GetWidget<PFilterController> {
  final Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Apply",
            onPress: () {
              controller.getFilteredJobs();
              Get.toNamed(RouteName.psearchResultScreenPath);
            }),
      ),
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Search Filter",
          ),
          20.verticalSpace,
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Search Keyword",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    EditText(controller: controller.keywordController, hintText: "Search here", context: context, bordercolor: Colors.transparent),
                    10.verticalSpace,
                    Text(
                      "Job Title",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    EditText(
                        controller: controller.jobTitleController,
                        hintText: "Lorem ipsum dolor sit amet consectetur",
                        context: context,
                        bordercolor: Colors.transparent),
                    10.verticalSpace,
                    Text(
                      "Job Date",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    EditText(
                        readonly: true,
                        controller: controller.dateController,
                        hintText: "06/29/2024",
                        context: context,
                        ONTAP: () {
                          controller.selectDate(context);
                        },
                        suffixIcon: ImageAssets.calendar,
                        bordercolor: Colors.transparent),
                    10.verticalSpace,
                    Text(
                      "Job Time",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 0.28.sw,
                                height: 0.07.sh,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xffDBE2EC)),
                                  color: Colors.white,
                                ),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    suffixIcon: Container(
                                      child: Image.asset(
                                        ImageAssets.arrowDown,
                                        scale: 2.5,
                                      ),
                                    ),
                                    hintText: "00",
                                    hintStyle: const TextStyle(
                                      color: Color(0xffA5A5A5),
                                    ), // Use hintText instead of labelText
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(bottom: 0, top: 7.0),
                                  ),
                                  // value: controller.selectedHours,
                                  icon: const SizedBox.shrink(),
                                  items: [
                                    '00',
                                    '01',
                                    '02',
                                    '03',
                                    '04',
                                    '05',
                                    '06',
                                    '07',
                                    '08',
                                    '09',
                                    '10',
                                    '11',
                                    '12',
                                    '13',
                                    '14',
                                    '15',
                                    '16',
                                    '17',
                                    '18',
                                    '19',
                                    '20',
                                    '21',
                                    '22',
                                    '23',
                                  ]
                                      .map((gender) => DropdownMenuItem(
                                            value: gender,
                                            child: Text(
                                              gender,
                                              style: TextStyle(fontSize: 14.sp, color: const Color(0xffA5A5A5)),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.selectedHours = value;
                                  },
                                ),
                              ),
                              Container(
                                height: 0.07.sh,
                                width: 0.28.sw,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xffDBE2EC)),
                                  color: Colors.white,
                                ),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    suffixIcon: Container(
                                      child: Image.asset(
                                        ImageAssets.arrowDown,
                                        scale: 2.5,
                                      ),
                                    ),
                                    hintText: "00",
                                    hintStyle: const TextStyle(
                                      color: Color(0xffA5A5A5),
                                    ), // Use hintText instead of labelText
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(bottom: 0, top: 7.0),
                                  ),
                                  // value: controller.selectedMints,
                                  icon: const SizedBox.shrink(),
                                  items: [
                                    '00',
                                    '01',
                                    '02',
                                    '03',
                                    '04',
                                    '05',
                                    '06',
                                    '07',
                                    '08',
                                    '09',
                                    '10',
                                    '11',
                                    '12',
                                    '13',
                                    '14',
                                    '15',
                                    '16',
                                    '17',
                                    '18',
                                    '19',
                                    '20',
                                    '21',
                                    '22',
                                    '23',
                                    '24',
                                    '25',
                                    '26',
                                    '27',
                                    '28',
                                    '29',
                                    '30',
                                    '31',
                                    '32',
                                    '33',
                                    '34',
                                    '35',
                                    '36',
                                    '37',
                                    '38',
                                    '39',
                                    '40',
                                    '41',
                                    '42',
                                    '43',
                                    '44',
                                    '45',
                                    '46',
                                    '47',
                                    '48',
                                    '49',
                                    '50',
                                    '51',
                                    '52',
                                    '53',
                                    '54',
                                    '55',
                                    '56',
                                    '57',
                                    '58',
                                    '59'
                                  ]
                                      .map((gender) => DropdownMenuItem(
                                            value: gender,
                                            child: Text(
                                              gender,
                                              style: TextStyle(fontSize: 14.sp, color: const Color(0xffA5A5A5)),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.selectedMints = value;

                                    controller.selectedTimeWithDate.value = controller.selectedDate
                                        .add(Duration(
                                            hours: int.parse(controller.selectedHours ?? "00"), minutes: int.parse(controller.selectedMints ?? "00")))
                                        .toIso8601String();
                                  },
                                ),
                              ),
                            ],
                          ),

                          InkWell(
                            onTap: () {
                              controller.isAm.value = true;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                              decoration: BoxDecoration(
                                  color: controller.isAm.value ? ColorUtils.blue : ColorUtils.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(width: 1.w, color: controller.isAm.value ? ColorUtils.blue : ColorUtils.borderColor)),
                              child: Text(
                                "AM",
                                style: TextStyle(fontSize: 16, color: controller.isAm.value ? ColorUtils.white : ColorUtils.black),
                              ),
                            ),
                          ),
                          // 10.horizontalSpace,
                          InkWell(
                            onTap: () {
                              controller.isAm.value = false;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                              decoration: BoxDecoration(
                                  color: controller.isAm.value ? ColorUtils.white : ColorUtils.blue,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(width: 1.w, color: controller.isAm.value ? ColorUtils.borderColor : ColorUtils.blue)),
                              child: Text(
                                "PM",
                                style: TextStyle(fontSize: 16, color: controller.isAm.value ? ColorUtils.black : ColorUtils.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Add location",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    EditText(
                        ONTAP: () async {
                          LatLng? result = await Get.to(() => MapScreen(
                                initialLocation: selectedLocation.value,
                              ));
                          if (result != null) {
                            selectedLocation.value = result;
                            controller.lat = result.latitude;
                            controller.long = result.longitude;

                            List<Placemark> placemarks = await placemarkFromCoordinates(result.latitude, result.longitude);
                            if (placemarks.isNotEmpty) {
                              Placemark placemark = placemarks.first;
                              String address = "${placemark.name}, ${placemark.locality}";

                              controller.locationEditingController.text = address.toString();

                              print(address);
                            }
                          }
                        },
                        hintText: "Lorem ipsum dolor sit amet consectetur",
                        context: context,
                        suffixIcon: ImageAssets.location,
                        controller: controller.locationEditingController,
                        bordercolor: Colors.transparent),
                    10.verticalSpace,
                    Text(
                      "Set Distance",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    Container(
                      width: 1.0.sw,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(fontSize: 13.sp, color: ColorUtils.textColor),
                              ),
                              Text(
                                "Miles",
                                style: TextStyle(fontSize: 13.sp, color: ColorUtils.textColor),
                              ),
                            ],
                          ),
                          Obx(
                            () => Expanded(
                              child: RangeSlider(
                                  values: RangeValues(controller.startDistance.value, controller.endDistance.value),
                                  min: 10,
                                  max: 80,
                                  activeColor: ColorUtils.black,
                                  inactiveColor: ColorUtils.txtLightGrey,
                                  divisions: 10,
                                  labels:
                                      RangeLabels(controller.startDistance.value.round().toString(), controller.endDistance.value.round().toString()),
                                  onChanged: (value) {
                                    controller.startDistance.value = value.start;
                                    controller.endDistance.value = value.end;
                                    controller.minRadius.value = value.start;
                                    controller.maxRadius.value = value.start;
                                  }),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "80",
                                style: TextStyle(fontSize: 13.sp, color: ColorUtils.textColor),
                              ),
                              Text(
                                "Miles",
                                style: TextStyle(fontSize: 13.sp, color: ColorUtils.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Set Budget",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                    ),
                    10.verticalSpace,
                    Container(
                      width: 1.0.sw,
                      child: Row(
                        children: [
                          Text(
                            "\$100",
                            style: TextStyle(fontSize: 13.sp, color: ColorUtils.textColor),
                          ),
                          Obx(
                            () => Expanded(
                              child: RangeSlider(
                                  values: RangeValues(controller.startPrice.value, controller.endPrice.value),
                                  min: 100,
                                  max: 350,
                                  activeColor: ColorUtils.black,
                                  inactiveColor: ColorUtils.txtLightGrey,
                                  divisions: 20,
                                  labels: RangeLabels(controller.startPrice.value.round().toString(), controller.endPrice.value.round().toString()),
                                  onChanged: (value) {
                                    controller.startPrice.value = value.start;

                                    controller.endPrice.value = value.end;
                                    controller.minBudget.value = value.start;
                                    controller.maxBudget.value = value.end;
                                  }),
                            ),
                          ),
                          Text(
                            "\$350",
                            style: TextStyle(fontSize: 13.sp, color: ColorUtils.textColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
