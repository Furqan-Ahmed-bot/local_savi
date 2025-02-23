import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/controllers/user_controllers/edit_job_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/resources/map/map_screen.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class EditJobScreen extends GetWidget<EditJobScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Save",
            onPress: () {
              controller.selectedTimeWithDate.value = controller.selectedDate
                  .add(Duration(hours: int.parse(controller.selectedHours ?? "00"), minutes: int.parse(controller.selectedMints ?? "00")))
                  .toIso8601String();
              UserServices.instance.editUerJobService(
                  context: context,
                  jobId: controller.jobDetail['id'],
                  workerType: controller.groupValue.value == 0 ? "PROFESSIONAL" : "HANDYMAN",
                  title: controller.titleController.text,
                  desc: controller.descController.text,
                  location: controller.locationEditingController.text,
                  lat: controller.latitide.toString(),
                  long: controller.longitude.toString(),
                  jobDate: controller.selectedDate.toIso8601String(),
                  startTime: controller.selectedTimeWithDate.value,
                  jobType: controller.jobDetail['job_type'],
                  budgetType: controller.fixedAmoount.value == 0 ? "FIXED" : "HOURLY",
                  budget: controller.priceController.text,
                  address: controller.addressController.text,
                  city: controller.jobDetail['city'],
                  state: controller.jobDetail['state'],
                  images: controller.listOfImages,
                  deletedImages: controller.listOfRemovedIndex);
            }),
      ),
      body: GetBuilder<EditJobScreenController>(builder: (controller) {
        return myBackGround(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              isMenu: false,
              title: "Edit Job",
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              children: [
                Text(
                  "Select Worker Type",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: controller.groupValue.value == 0 ? ColorUtils.red : ColorUtils.white,
                              ),
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: 0,
                                    activeColor: ColorUtils.white,
                                    groupValue: controller.groupValue.value,
                                    onChanged: (int? value) {
                                      controller.groupValue.value = value!;
                                    },
                                  ),
                                  Text(
                                    "Professional",
                                    style: TextStyle(fontSize: 16.sp, color: controller.groupValue.value == 0 ? ColorUtils.white : ColorUtils.black),
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
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: controller.groupValue.value == 1 ? ColorUtils.red : ColorUtils.white,
                              ),
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: 1,
                                    activeColor: ColorUtils.white,
                                    groupValue: controller.groupValue.value,
                                    onChanged: (int? value) {
                                      controller.groupValue.value = value!;
                                    },
                                  ),
                                  Text(
                                    "Handyman",
                                    style: TextStyle(fontSize: 16.sp, color: controller.groupValue.value == 1 ? ColorUtils.white : ColorUtils.black),
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
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                ),
                10.verticalSpace,
                EditText(controller: controller.titleController, hintText: "Title", context: context, bordercolor: Colors.transparent),
                10.verticalSpace,
                Text(
                  "Job Date",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                ),
                10.verticalSpace,
                EditText(
                    ONTAP: () {
                      controller.selectDate(context);
                    },
                    hintText: "06/29/2024",
                    context: context,
                    readonly: true,
                    controller: controller.dateController,
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
                                          style: TextStyle(fontSize: 14.sp, color: const Color(0xffA5A5A5)),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectedHours = value;

                                  // Check if the selected time is valid
                                  if (!controller.isTimeValid(controller.selectedDate, controller.selectedHours ?? "00",
                                      controller.selectedMints ?? "00", controller.isAm.value)) {
                                    // Show an error message or reset the selection
                                    Get.snackbar("Invalid Time", "You cannot select a time earlier than the current time for today.");
                                    return;
                                  }

                                  DateTime localTime = controller.selectedDate.add(Duration(
                                    hours: int.parse(controller.selectedHours ?? "00"),
                                    minutes: int.parse(controller.selectedMints ?? "00"),
                                  ));

                                  DateTime utcTime = localTime.toUtc();

                                  controller.selectedTimeWithDate.value = utcTime.toIso8601String();
                                }
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
                                          style: TextStyle(fontSize: 14.sp, color: const Color(0xffA5A5A5)),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectedMints = value;

                                  // Check if the selected time is valid
                                  if (!controller.isTimeValid(controller.selectedDate, controller.selectedHours ?? "00",
                                      controller.selectedMints ?? "00", controller.isAm.value)) {
                                    // Show an error message or reset the selection
                                    Get.snackbar("Invalid Time", "You cannot select a time earlier than the current time for today.");
                                    return;
                                  }

                                  DateTime localTime = controller.selectedDate.add(Duration(
                                    hours: int.parse(controller.selectedHours ?? "00"),
                                    minutes: int.parse(controller.selectedMints ?? "00"),
                                  ));

                                  DateTime utcTime = localTime.toUtc();

                                  controller.selectedTimeWithDate.value = utcTime.toIso8601String();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          controller.isAm.value = true;

                          // Check if the selected time is valid after changing AM/PM
                          if (!controller.isTimeValid(
                              controller.selectedDate, controller.selectedHours ?? "00", controller.selectedMints ?? "00", controller.isAm.value)) {
                            Get.snackbar("Invalid Time", "You cannot select a time earlier than the current time for today.");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            color: controller.isAm.value ? ColorUtils.blue : ColorUtils.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(width: 1.w, color: controller.isAm.value ? ColorUtils.blue : ColorUtils.borderColor),
                          ),
                          child: Text(
                            "AM",
                            style: TextStyle(fontSize: 16, color: controller.isAm.value ? ColorUtils.white : ColorUtils.black),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.isAm.value = false;

                          // Check if the selected time is valid after changing AM/PM
                          if (!controller.isTimeValid(
                              controller.selectedDate, controller.selectedHours ?? "00", controller.selectedMints ?? "00", controller.isAm.value)) {
                            Get.snackbar("Invalid Time", "You cannot select a time earlier than the current time for today.");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            color: controller.isAm.value ? ColorUtils.white : ColorUtils.blue,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(width: 1.w, color: controller.isAm.value ? ColorUtils.borderColor : ColorUtils.blue),
                          ),
                          child: Text(
                            "PM",
                            style: TextStyle(fontSize: 16, color: controller.isAm.value ? ColorUtils.black : ColorUtils.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Text(
                  "Write a job description",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                ),
                10.verticalSpace,
                EditText(
                    controller: controller.descController,
                    hintText: "Description",
                    context: context,
                    minLines: 5,
                    maxLines: 5,
                    bordercolor: Colors.transparent),
                20.verticalSpace,
                Column(
                  children: [
                    SingleChildScrollView(
                      child: Row(
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
                                border: Border.all(width: 0.5, color: ColorUtils.borderColor),
                                color: ColorUtils.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageAssets.helpFeedbackAdd,
                                    scale: 2,
                                  ),
                                  Text(
                                    "Add More",
                                    style: TextStyle(fontSize: 14.sp, color: ColorUtils.txtLightGrey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // for (var img in controller.listOfImages)
                          for (int i = 0; i < controller.listOfImages.length; i++)
                            Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    height: 0.27.sw,
                                    width: 0.27.sw,
                                    child: controller.listOfImages[i] != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(10.r),
                                            child: Image.file(
                                              controller.listOfImages[i],
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : Image.asset(ImageAssets.oliverImg)
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
                                Positioned(
                                  top: 10.h,
                                  right: 10.w,
                                  child: InkWell(
                                    onTap: () {
                                      controller.listOfImages.removeAt(i);
                                      controller.update();
                                    },
                                    child: Image.asset(
                                      ImageAssets.helpFeedbackCUt,
                                      scale: 2.5,
                                    ),
                                  ),
                                )
                              ],
                            ),

                          Row(
                            children: List.generate(
                                controller.listOfNetworkImages.length,
                                (index) => Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                                width: 100, height: 100, fit: BoxFit.fill, controller.listOfNetworkImages[index]['media_file']),
                                          ),
                                          Positioned(
                                            top: 10.h,
                                            right: 10.w,
                                            child: InkWell(
                                              onTap: () {
                                                controller.listOfRemovedIndex.add(controller.listOfNetworkImages[index]['id']);
                                                controller.listOfNetworkImages.removeAt(index);
                                              },
                                              child: Image.asset(
                                                ImageAssets.helpFeedbackCUt,
                                                scale: 2.5,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Text(
                  "Job Location",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                ),
                20.verticalSpace,
                Text(
                  "Address",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                ),
                10.verticalSpace,
                EditText(controller: controller.addressController, hintText: "Address", context: context, bordercolor: Colors.transparent),
                10.verticalSpace,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "State",
                //           style: TextStyle(
                //               fontSize: 16.sp,
                //               fontWeight: FontWeight.w600,
                //               color: ColorUtils.black),
                //         ),
                //         10.verticalSpace,
                //         EditText(
                //             width: 0.42.sw,
                //             hintText: "State",
                //             context: context,
                //             isDropDown: true,
                //             suffixIcon: ImageAssets.arrowDown,
                //             bordercolor: Colors.transparent),
                //       ],
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "City",
                //           style: TextStyle(
                //               fontSize: 16.sp,
                //               fontWeight: FontWeight.w600,
                //               color: ColorUtils.black),
                //         ),
                //         10.verticalSpace,
                //         EditText(
                //             width: 0.42.sw,
                //             hintText: "City",
                //             context: context,
                //             isDropDown: true,
                //             suffixIcon: ImageAssets.arrowDown,
                //             bordercolor: Colors.transparent),
                //       ],
                //     ),
                //   ],
                // ),

                10.verticalSpace,
                Text(
                  "Add Location",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorUtils.black),
                ),
                10.verticalSpace,
                EditText(
                    ONTAP: () async {
                      LatLng? result = await Get.to(() => MapScreen(
                            initialLocation: controller.selectedLocation.value,
                          ));
                      if (result != null) {
                        controller.selectedLocation.value = result;
                        controller.latitide = result.latitude;
                        controller.longitude = result.longitude;

                        List<Placemark> placemarks = await placemarkFromCoordinates(result.latitude, result.longitude);
                        if (placemarks.isNotEmpty) {
                          Placemark placemark = placemarks.first;
                          String address = "${placemark.name}, ${placemark.locality}";

                          controller.locationEditingController.text = address.toString();

                          print(address);
                        }
                      }

                      print('hello tapped');
                    },
                    hintText: "Location",
                    context: context,
                    controller: controller.locationEditingController,
                    suffixIcon: ImageAssets.location,
                    bordercolor: Colors.transparent),
                10.verticalSpace,
                Text(
                  "Budget",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                Text(
                  "Job Type",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
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
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(width: 1.0, color: ColorUtils.borderColor)),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: 0,
                            activeColor: ColorUtils.blue,
                            groupValue: controller.fixedAmoount.value,
                            onChanged: (int? value) {
                              controller.fixedAmoount.value = value!;
                            },
                          ),
                          Text(
                            "Fixed Amount",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: ColorUtils.black),
                          ),
                          Text(
                            " (Pay a fixed amount for the job)",
                            style: TextStyle(fontSize: 13.sp, color: ColorUtils.black),
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
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(width: 1.0, color: ColorUtils.borderColor)),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            activeColor: ColorUtils.blue,
                            groupValue: controller.fixedAmoount.value,
                            onChanged: (int? value) {
                              controller.fixedAmoount.value = value!;
                            },
                          ),
                          Text(
                            "Per Hourly",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: ColorUtils.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Text(
                  "Enter Budget",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: ColorUtils.black),
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
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), bottomLeft: Radius.circular(10.r))),
                        child: Text(
                          "USD",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      EditText(
                          controller: controller.priceController,
                          width: 0.7.sw,
                          hintText: "Enter Your Budget 0.00",
                          context: context,
                          bordercolor: Colors.transparent),
                    ],
                  ),
                ),
                30.verticalSpace,
              ],
            ))
          ],
        ));
      }),
    );
  }
}
