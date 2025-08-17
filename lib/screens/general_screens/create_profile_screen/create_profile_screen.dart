// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/create_profile_controller.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/phone_textform_widget/phone_textformwidget.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/validations.dart';

import '../../../resources/components/back_appbar_button.dart';
import '../../../resources/map/map_screen.dart';
import '../../../utils/constant.dart';
import '../../../utils/images/image_assets.dart';

import 'textfromfield_widget/textformfield_widget.dart';

class CreateProfileScreen extends GetWidget<CreateProfileController> {
  final Rx<LatLng> selectedLocation = const LatLng(0.0, 0.0).obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProfileController>(builder: (controller) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD6EFFF), // Light blue shade for the top
              Color(0xFFFFFFFF), // White shade for the bottom
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: BackButtonWidget(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: const Text(
                  'Create Profile',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => Form(
                      key: controller.formKey,
                      autovalidateMode: controller.isValidate.value == true
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.verticalSpace,
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: ColorUtils.red, width: 8),
                                  ),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: controller.image != null
                                        ? FileImage(controller.image!)
                                        : null,
                                    child: controller.image == null
                                        ? ClipOval(
                                            child: Image.asset(
                                                ImageAssets.placeholderImg))
                                        : null,
                                  ),
                                ),
                                Positioned(
                                  bottom: 3,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: controller.getImage,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(255, 45, 85, 118),
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          30.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 0.07.sh,
                                width: 0.43.sw, 
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffDBE2EC)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: controller.firstNamecontroller,
                                  validator: validateFirstName,
                                  decoration: InputDecoration(
                                    hintText: 'First Name',
                                    prefixIcon: Container(
                                      child: Image.asset(
                                        ImageAssets.firstname,
                                        scale: 1.1,
                                      ),
                                    ),
                                    hintStyle: const TextStyle(
                                      color: Color(0xffA5A5A5),
                                      fontSize: 15.0,
                                      letterSpacing: 0,
                                    ),

                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 12,
                                        top:
                                            0.0), 
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                ),
                              ),
                              Container(
                                height: 0.07.sh,
                                width: 0.43.sw, 

                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffDBE2EC)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: controller.lastNamecontroller,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  validator: validateLastName,
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    prefixIcon: Container(
                                      child: Image.asset(
                                        ImageAssets.firstname,
                                        scale: 1.1,
                                      ),
                                    ),
                                    hintStyle: const TextStyle(
                                      color: Color(0xffA5A5A5),
                                      fontSize: 15.0,
                                      letterSpacing: 0,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 12,
                                        top:
                                            0.0), // this can adjust the label and text position
                                    //or transparent
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                ),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          LabelTextFormFieldWidget(
                            controller: controller.datecontroller,
                            height: 50,
                            readOnly: true,
                            validation: validateDOB,
                            labeltext: 'Date of Birth',
                            issufficsenable: true,
                            suffixicon: ImageAssets.smallcalendar,
                            onFulltap: () {
                              controller.selectDate(context);
                            },
                            ontap: () {
                              // controller.selectDate(context);
                            },
                          ),
                          20.verticalSpace,
                          Container(
                            height: 0.07.sh,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffDBE2EC)),
                              color: Colors.white,
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                suffixIcon: Container(
                                  child: Image.asset(
                                    ImageAssets.arrowDown,
                                    scale: 2,
                                  ),
                                ),
                                hintText: 'Gender',
                                hintStyle: const TextStyle(
                                  color: Color(0xffA5A5A5),
                                ), // Use hintText instead of labelText
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 0, top: 7.0),
                              ),
                              value: controller.selectedGender,
                              icon: const SizedBox.shrink(),
                              items: ['Male', 'Female', 'Other']
                                  .map((gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text(
                                          gender,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedGender = value!;
                                controller.update();
                              },
                            ),
                          ),
                          20.verticalSpace,
                          LabelTextFormFieldWidget(
                            height: 50,
                            labeltext: 'Address',
                            validation: validateAddress,
                            controller: controller.addresscontroller,
                            issufficsenable: false,
                          ),
                          // 20.verticalSpace,
                          // InkWell(
                          //   onTap: () {
                          //     FocusScope.of(context).unfocus();
                          //   },
                          //   child: CSCPicker(
                          //     showStates: true,
                          //     showCities: true,
                          //     dropdownDecoration: BoxDecoration(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(10)),
                          //         color: Colors.white,
                          //         border: Border.all(
                          //             color: Colors.grey.shade300, width: 1)),
                          //     countrySearchPlaceholder: "Country",
                          //     stateSearchPlaceholder: "State",
                          //     citySearchPlaceholder: "City",
                          //     countryDropdownLabel: "Country",
                          //     stateDropdownLabel: "State",
                          //     cityDropdownLabel: "City",
                          //     defaultCountry: CscCountry.United_States,
                          //     disableCountry: true,
                          //     selectedItemStyle: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 14,
                          //     ),
                          //     dropdownHeadingStyle: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: 17,
                          //         fontWeight: FontWeight.bold),
                          //     dropdownItemStyle: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 14,
                          //     ),
                          //     dropdownDialogRadius: 10.0,
                          //     searchBarRadius: 10.0,
                          //     onCountryChanged: (value) {},
                          //     onStateChanged: (value) {
                          //       controller.state.value = value.toString();
                          //     },
                          //     onCityChanged: (value) {
                          //       controller.city.value = value.toString();
                          //     },
                          //   ),
                          // ),
                          20.verticalSpace,
                          LabelTextFormFieldWidget(
                            height: 50,
                            labeltext: 'Location',
                            issufficsenable: true,
                            validation: validateLocation,
                            readOnly: true,
                            suffixicon: ImageAssets.userlocation,
                            controller: controller.locationcontroller,
                            onFulltap: () async {
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
                                  print(placemark.administrativeArea);
                                  print(placemark.locality);
                                  print(placemark.subLocality);
                                  print(placemark.subAdministrativeArea);
                                  print(placemark.name);
                                  print(placemark.thoroughfare);
                                  print(placemark.postalCode);
                                  String address =
                                      "${placemark.name}, ${placemark.thoroughfare} , ${placemark.locality}";

                                  controller.locationcontroller.text =
                                      address.toString();

                                   print(address);
                                }
                              }
                              // controller.selectDate(context);
                              // controller.update();
                            },
                          ),
                          20.verticalSpace,
                          LabelTextFormFieldWidget(
                            maxlines: 5,
                            labeltext: 'About',
                            issufficsenable: false,
                            validation: validateAbout,
                            controller: controller.aboutcontroller,
                            ontap: () {
                              // controller.selectDate(context);
                              controller.update();
                            },
                          ),
                          20.verticalSpace,
                          Container(
                            height: 0.07.sh,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffDBE2EC)),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              readOnly: true,
                              controller: controller.emailcontroller,
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  child: Image.asset(
                                    ImageAssets.emailname,
                                    scale: 1.1,
                                  ),
                                ),
                                hintText: 'Email',

                                hintStyle: const TextStyle(
                                  color: Color(0xffA5A5A5),
                                  fontSize: 15.0,
                                  letterSpacing: 0,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    bottom: 13,
                                    top:
                                        0.0), // this can adjust the label and text position
                                filled: true,
                                fillColor: Colors.transparent, //or transparent
                              ),
                              textAlignVertical: TextAlignVertical.bottom,
                            ),
                          ),
                          20.verticalSpace,
                          phoneTextFormFieldWidget(
                            phonecontroller: controller.phonecontroller,
                          ),
                          20.verticalSpace,
                          RoundButton(
                              buttonColor: const Color(0xffE50000),
                              height: 40,
                              width: 0.9.sw,
                              title: 'Continue',
                              onPress: () {
                                if (role.value == 'USER') {
                                  controller.validation(context);
                                } else if (role.value == 'PROFESSIONAL') {
                                  controller.validation(context);
                                  // Get.toNamed(RouteName.cretaetProfileTwoPath);
                                } else {
                                  controller.validation(context);
                                  //Get.toNamed(RouteName.createHandyManProfilePath);
                                }
                              }),
                          25.verticalSpace
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}


