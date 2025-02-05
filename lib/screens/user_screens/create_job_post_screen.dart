// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/controllers/user_controllers/create_job_post_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../resources/map/map_screen.dart';

class CreateJobPostScreen extends GetWidget<CreateJobPostScreenController> {
  final Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: Obx(
          () => RoundButton(
              buttonColor: ColorUtils.red,
              title: controller.stepIndex.value < 2 ? "Continue" : "Pay Now",
              onPress: () {
                if (controller.stepIndex.value == 0) {
                  if (controller.titleEditingController.text.isNotEmpty) {
                    if (controller.dateController.text.isNotEmpty) {
                      if (controller.descEditingController.text.isNotEmpty) {
                        if (controller
                            .addressEditingController.text.isNotEmpty) {
                          if (controller.state.value != "") {
                            if (controller.listOfImages.isNotEmpty) {
                              controller.stepIndex.value =
                                  controller.stepIndex.value + 1;
                              controller.update();
                            } else {
                              Get.snackbar(
                                "Alert",
                                "Please add Images",
                                backgroundColor: ColorUtils.white,
                              );
                            }
                          } else {
                            Get.snackbar(
                              "Alert",
                              "Please select State",
                              backgroundColor: ColorUtils.white,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Alert",
                            "Please add address",
                            backgroundColor: ColorUtils.white,
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Alert",
                          "Please add description",
                          backgroundColor: ColorUtils.white,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Alert",
                        "Please select Date",
                        backgroundColor: ColorUtils.white,
                      );
                    }
                  } else {
                    Get.snackbar(
                      "Alert",
                      "Please add Job Title",
                      backgroundColor: ColorUtils.white,
                    );
                  }
                } else if (controller.stepIndex.value == 1) {
                  if (controller.priceBudgetEditingController.text.isNotEmpty) {
                    controller.stepIndex.value = controller.stepIndex.value + 1;
                    controller.update();
                  } else {
                    Get.snackbar(
                      "Alert",
                      "Please add your budget",
                      backgroundColor: ColorUtils.white,
                    );
                  }
                } else {
                  controller.selectedTimeWithDate.value = controller
                      .selectedDate
                      .add(Duration(
                          hours: int.parse(controller.selectedHours ?? "00"),
                          minutes: int.parse(controller.selectedMints ?? "00")))
                      .toIso8601String();
                  UserServices.instance.createJob(
                      context: context,
                      WorkerType: controller.groupValue.value == 0
                          ? "PROFESSIONAL"
                          : "HANDYMAN",
                      title: controller.titleEditingController.text,
                      desc: controller.descEditingController.text,
                      location: "USA",
                      lat: controller.latitide.toString(),
                      long: controller.longitude.toString(),
                      jobDate: controller.dateController.text,
                      startTime: controller.selectedTimeWithDate.value,
                      jobType: controller.workingHour.value == 0
                          ? "WORKINGHOUR"
                          : "AFTERHOUR",
                      budgetType: controller.fixedAmoount.value == 0
                          ? "FIXED"
                          : "PERHOURLY",
                      budget: controller.priceBudgetEditingController.text,
                      address: controller.addressEditingController.text,
                      city: controller.city.value != ""
                          ? controller.city.value
                          : controller.state.value,
                      state: controller.state.value,
                      images: controller.listOfImages);
                }
              }),
        ),
      ),
      body: myBackGround(child:
          GetBuilder<CreateJobPostScreenController>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appbar(
                isMenu: false,
                title: "Create Job",
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      20.h.verticalSpace,
                      Container(
                        width: 1.0.sw,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(4.sp),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.black,
                                      ),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                          color: ColorUtils.white,
                                        ),
                                      ),
                                    )),
                                // 5.verticalSpace,
                                Text(
                                  "Job Details",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Container(
                              width: 0.18.sw,
                              child: MySeparator(
                                height: 1,
                                color: ColorUtils.borderColor,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(4.sp),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.stepIndex.value < 1
                                            ? ColorUtils.txtLightGrey
                                            : ColorUtils.black,
                                      ),
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                          color: ColorUtils.white,
                                        ),
                                      ),
                                    )),
                                // 5.verticalSpace,
                                Text(
                                  "Budget",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Container(
                              width: 0.18.sw,
                              child: MySeparator(
                                height: 1,
                                color: ColorUtils.borderColor,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(4.sp),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.stepIndex.value < 2
                                            ? ColorUtils.txtLightGrey
                                            : ColorUtils.black,
                                      ),
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                          color: ColorUtils.white,
                                        ),
                                      ),
                                    )),
                                // 5.verticalSpace,
                                Text(
                                  "Payment",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      5.verticalSpace,
                      Divider(
                        color: ColorUtils.borderColor,
                      ),
                      10.verticalSpace,
                    ],
                  ),
                ),
              ),
              controller.stepIndex.value == 0
                  ? Expanded(
                      child: ListView(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      children: [
                        Text(
                          "Select Worker Type",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        10.verticalSpace,
                        Container(
                          width: 1.0.sw,
                          child: Obx(
                            () => Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      controller.groupValue.value = 0;
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: controller.groupValue.value == 0
                                            ? ColorUtils.red
                                            : ColorUtils.white,
                                      ),
                                      child: Row(
                                        children: [
                                          Radio<int>(
                                            value: 0,
                                            activeColor: ColorUtils.white,
                                            groupValue:
                                                controller.groupValue.value,
                                            onChanged: (int? value) {
                                              controller.groupValue.value =
                                                  value!;
                                            },
                                          ),
                                          Text(
                                            "Professional",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: controller
                                                            .groupValue.value ==
                                                        0
                                                    ? ColorUtils.white
                                                    : ColorUtils.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      controller.groupValue.value = 1;
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: controller.groupValue.value == 1
                                            ? ColorUtils.red
                                            : ColorUtils.white,
                                      ),
                                      child: Row(
                                        children: [
                                          Radio<int>(
                                            value: 1,
                                            activeColor: ColorUtils.white,
                                            groupValue:
                                                controller.groupValue.value,
                                            onChanged: (int? value) {
                                              controller.groupValue.value =
                                                  value!;
                                            },
                                          ),
                                          Text(
                                            "Handyman",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: controller
                                                            .groupValue.value ==
                                                        1
                                                    ? ColorUtils.white
                                                    : ColorUtils.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          "Job Title",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        10.verticalSpace,
                        EditText(
                            hintText: "Title",
                            context: context,
                            controller: controller.titleEditingController,
                            bordercolor: Colors.transparent),
                        10.verticalSpace,
                        Text(
                          "Job Date",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        10.verticalSpace,
                        EditText(
                            hintText: "06/29/2025",
                            context: context,
                            readonly: true,
                            ONTAP: () {
                              controller.selectDate(context);
                            },
                            controller: controller.dateController,
                            suffixIcon: ImageAssets.calendar,
                            bordercolor: Colors.transparent),
                        10.verticalSpace,
                        Text(
                          "Job Time",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        10.verticalSpace,
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 0.28.sw,
                                    height: 0.07.sh,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffDBE2EC)),
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
                                        contentPadding: const EdgeInsets.only(
                                            bottom: 0, top: 7.0),
                                      ),
                                      value: controller.selectedHours,
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
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0xffA5A5A5)),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffDBE2EC)),
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
                                        contentPadding: const EdgeInsets.only(
                                            bottom: 0, top: 7.0),
                                      ),
                                      value: controller.selectedMints,
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
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0xffA5A5A5)),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        controller.selectedMints = value;
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18.w, vertical: 16.h),
                                  decoration: BoxDecoration(
                                      color: controller.isAm.value
                                          ? ColorUtils.blue
                                          : ColorUtils.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          width: 1.w,
                                          color: controller.isAm.value
                                              ? ColorUtils.blue
                                              : ColorUtils.borderColor)),
                                  child: Text(
                                    "AM",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: controller.isAm.value
                                            ? ColorUtils.white
                                            : ColorUtils.black),
                                  ),
                                ),
                              ),
                              // 10.horizontalSpace,
                              InkWell(
                                onTap: () {
                                  controller.isAm.value = false;
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18.w, vertical: 16.h),
                                  decoration: BoxDecoration(
                                      color: controller.isAm.value
                                          ? ColorUtils.white
                                          : ColorUtils.blue,
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          width: 1.w,
                                          color: controller.isAm.value
                                              ? ColorUtils.borderColor
                                              : ColorUtils.blue)),
                                  child: Text(
                                    "PM",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: controller.isAm.value
                                            ? ColorUtils.black
                                            : ColorUtils.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          "Write a job description",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        10.verticalSpace,
                        EditText(
                            hintText: "Write you description here...",
                            context: context,
                            minLines: 5,
                            maxLines: 5,
                            controller: controller.descEditingController,
                            bordercolor: Colors.transparent),
                        20.verticalSpace,
                        SizedBox(
                          width: 1.0.sw,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.getImage();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    height: 0.27.sw,
                                    width: 0.27.sw,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          width: 0.5,
                                          color: ColorUtils.borderColor),
                                      color: ColorUtils.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ImageAssets.helpFeedbackAdd,
                                          scale: 2,
                                        ),
                                        Text(
                                          "Add More",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: ColorUtils.txtLightGrey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // for (var img in controller.listOfImages)
                                for (int i = 0;
                                    i < controller.listOfImages.length;
                                    i++)
                                  Stack(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 10.w),
                                          height: 0.27.sw,
                                          width: 0.27.sw,
                                          child: controller.listOfImages[i] !=
                                                  null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  child: Image.file(
                                                    controller.listOfImages[i],
                                                    fit: BoxFit.fill,
                                                  ),
                                                )
                                              : Image.asset(
                                                  ImageAssets.oliverImg)
                                          // Image.asset(
                                          //   backgroundImage: controller.image != null
                                          //       ? FileImage(controller.image!)
                                          //       : null,
                                          //   child: controller.image == null
                                          //       ? Image.asset(ImageAssets.oliverImg)
                                          //       : null,

                                          //   ImageAssets.helpFeedback1,
                                          //   scale: 2,
                                          // ),
                                          ),
                                      InkWell(
                                        onTap: () {
                                          controller.listOfImages.removeAt(i);
                                          controller.update();
                                        },
                                        child: Positioned(
                                            top: 10.h,
                                            right: 10.w,
                                            child: Image.asset(
                                              ImageAssets.helpFeedbackCUt,
                                              scale: 2.5,
                                            )),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          "Job Location",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        20.verticalSpace,
                        Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        10.verticalSpace,
                        EditText(
                            hintText: "Job Address...",
                            context: context,
                            controller: controller.addressEditingController,
                            bordercolor: Colors.transparent),
                        10.verticalSpace,
                        InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: CSCPicker(
                            showStates: true,
                            showCities: true,
                            dropdownDecoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1)),
                            countrySearchPlaceholder: "Country",
                            stateSearchPlaceholder: "State",
                            citySearchPlaceholder: "City",
                            countryDropdownLabel: "Country",
                            stateDropdownLabel: "State",
                            cityDropdownLabel: "City",
                            defaultCountry: CscCountry.United_States,
                            disableCountry: true,
                            selectedItemStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            dropdownHeadingStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            dropdownItemStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            dropdownDialogRadius: 10.0,
                            searchBarRadius: 10.0,
                            onCountryChanged: (value) {},
                            onStateChanged: (value) {
                              controller.state.value = value.toString();
                            },
                            onCityChanged: (value) {
                              controller.city.value = value.toString();
                            },
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          "Add Location",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        10.verticalSpace,
                        EditText(
                            ONTAP: () async {
                              LatLng? result = await Get.to(() => MapScreen(
                                    initialLocation: selectedLocation.value,
                                  ));
                              if (result != null) {
                                selectedLocation.value = result;
                                controller.latitide = result.latitude;
                                controller.longitude = result.longitude;

                                List<Placemark> placemarks =
                                    await placemarkFromCoordinates(
                                        result.latitude, result.longitude);
                                if (placemarks.isNotEmpty) {
                                  Placemark placemark = placemarks.first;
                                  String address =
                                      "${placemark.name}, ${placemark.locality}";

                                  controller.locationEditingController.text =
                                      address.toString();

                                  print(address);
                                }
                              }
                              // controller.selectDate(context);
                              // controller.update();

                              print('hello tapped');
                            },
                            hintText: "Lorem ipsum dolor sit amet consectetur",
                            context: context,
                            controller: controller.locationEditingController,
                            suffixIcon: ImageAssets.location,
                            bordercolor: Colors.transparent),
                        30.verticalSpace,
                      ],
                    ))
                  : controller.stepIndex.value == 1
                      ? Expanded(
                          child: ListView(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          children: [
                            Text(
                              "Job Type",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                            10.verticalSpace,
                            Container(
                              width: 1.0.sw,
                              child: Obx(
                                () => Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.workingHour.value = 0;
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color:
                                                controller.workingHour.value ==
                                                        0
                                                    ? ColorUtils.red
                                                    : ColorUtils.white,
                                          ),
                                          child: Row(
                                            children: [
                                              Radio<int>(
                                                value: 0,
                                                activeColor: ColorUtils.white,
                                                groupValue: controller
                                                    .workingHour.value,
                                                onChanged: (int? value) {
                                                  controller.workingHour.value =
                                                      value!;
                                                },
                                              ),
                                              Text(
                                                "Working Hour",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: controller
                                                                .workingHour
                                                                .value ==
                                                            0
                                                        ? ColorUtils.white
                                                        : ColorUtils.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.workingHour.value = 1;
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color:
                                                controller.workingHour.value ==
                                                        1
                                                    ? ColorUtils.red
                                                    : ColorUtils.white,
                                          ),
                                          child: Row(
                                            children: [
                                              Radio<int>(
                                                value: 1,
                                                activeColor: ColorUtils.white,
                                                groupValue: controller
                                                    .workingHour.value,
                                                onChanged: (int? value) {
                                                  controller.workingHour.value =
                                                      value!;
                                                },
                                              ),
                                              Text(
                                                "After Hour",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: controller
                                                                .workingHour
                                                                .value ==
                                                            1
                                                        ? ColorUtils.white
                                                        : ColorUtils.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.fixedAmoount.value = 0;
                                },
                                child: Container(
                                  width: 1.0.sw,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      border: Border.all(
                                          width: 1.0,
                                          color: ColorUtils.borderColor)),
                                  child: Row(
                                    children: [
                                      Radio<int>(
                                        value: 0,
                                        activeColor: ColorUtils.blue,
                                        groupValue:
                                            controller.fixedAmoount.value,
                                        onChanged: (int? value) {
                                          controller.fixedAmoount.value =
                                              value!;
                                        },
                                      ),
                                      Text(
                                        "Fixed Amount",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: ColorUtils.black),
                                      ),
                                      Text(
                                        " (Pay a fixed amount for the job)",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: ColorUtils.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.fixedAmoount.value = 1;
                                },
                                child: Container(
                                  width: 1.0.sw,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      border: Border.all(
                                          width: 1.0,
                                          color: ColorUtils.borderColor)),
                                  child: Row(
                                    children: [
                                      Radio<int>(
                                        value: 1,
                                        activeColor: ColorUtils.blue,
                                        groupValue:
                                            controller.fixedAmoount.value,
                                        onChanged: (int? value) {
                                          controller.fixedAmoount.value =
                                              value!;
                                        },
                                      ),
                                      Text(
                                        "Per Hourly",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: ColorUtils.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              "Enter Budget",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: ColorUtils.black),
                            ),
                            10.verticalSpace,
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 0.2.sw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorUtils.jobIconBG,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            bottomLeft: Radius.circular(10.r))),
                                    child: const Text(
                                      "USD",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  EditText(
                                      width: 0.7.sw,
                                      textInputType: const TextInputType
                                          .numberWithOptions(),
                                      controller: controller
                                          .priceBudgetEditingController,
                                      hintText: "Enter Your Budget 0.00",
                                      context: context,
                                      bordercolor: Colors.transparent),
                                ],
                              ),
                            )
                          ],
                        ))
                      : Expanded(
                          child: ListView(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          children: [
                            20.verticalSpace,
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 0.72.sw,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorUtils.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            bottomLeft: Radius.circular(10.r))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Job Budget",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              controller
                                                  .priceBudgetEditingController
                                                  .text,
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              controller.fixedAmoount.value == 0
                                                  ? "(Fixed)"
                                                  : "(/hour)",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.stepIndex.value = 1;
                                      controller.update();
                                    },
                                    child: Container(
                                        height: 60.h,
                                        width: 0.17.sw,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: ColorUtils.jobIconBG,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.r),
                                                bottomRight:
                                                    Radius.circular(10.r))),
                                        child: Image.asset(
                                          ImageAssets.editIcon,
                                          scale: 2,
                                          color: ColorUtils.black,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              "Select Payment Method",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                            10.verticalSpace,
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.cardvalue.value = 0;
                                },
                                child: Container(
                                  width: 1.0.sw,
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.w,
                                          color: ColorUtils.borderColor),
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: ColorUtils.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Radio<int>(
                                            value: 0,
                                            activeColor: ColorUtils.blue,
                                            groupValue:
                                                controller.cardvalue.value,
                                            onChanged: (int? value) {
                                              controller.cardvalue.value =
                                                  value!;
                                            },
                                          ),
                                          20.horizontalSpace,
                                          Text(
                                            "Wallet",
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10.w),
                                        child: Image.asset(
                                          ImageAssets.drawerWallet,
                                          scale: 2,
                                          color: ColorUtils.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    controller.ListOfText.length, (index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.cardvalue.value = index + 1;
                                    },
                                    child: Container(
                                      width: 1.0.sw,
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.w,
                                              color: ColorUtils.borderColor),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: ColorUtils.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Radio<int>(
                                                value: index + 1,
                                                activeColor: ColorUtils.blue,
                                                groupValue:
                                                    controller.cardvalue.value,
                                                onChanged: (int? value) {
                                                  controller.cardvalue.value =
                                                      value!;
                                                },
                                              ),
                                              20.horizontalSpace,
                                              Text(
                                                controller.ListOfText[index]
                                                    ['title'],
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(right: 10.w),
                                            child: Image.asset(
                                              controller.ListOfText[index]
                                                  ['image'],
                                              scale: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  ImageAssets.addCircleRed,
                                  scale: 2,
                                ),
                                5.horizontalSpace,
                                Text(
                                  "Add Card",
                                  style: TextStyle(
                                      fontSize: 14.sp, color: ColorUtils.red),
                                )
                              ],
                            )
                          ],
                        ))
            ],
          ),
        );
      })),
    );
  }
}
