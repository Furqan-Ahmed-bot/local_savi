import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/controllers/user_controllers/edit_profile_screen_controller.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/phone_textform_widget/phone_textformwidget.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/textfromfield_widget/textformfield_widget.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../resources/components/round_button.dart';
import '../../resources/map/show_map_screen.dart';

class EditProfileScreen extends GetWidget<EditProfileScreenController> {
  final Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Edit Profile',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: GetBuilder<EditProfileScreenController>(builder: (cotnroller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        controller.image == null
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: ColorUtils.red, width: 8),
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(role.value == "USER"
                                      ? controller.userdata.userDetails!.profilePicture ?? ""
                                      : controller.performerdata.userDetails!.profilePicture ?? ""),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: ColorUtils.red, width: 8),
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: controller.image != null ? FileImage(controller.image!) : null,
                                  child: controller.image == null ? Image.asset(ImageAssets.oliverImg) : null,
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
                        width: 0.42.sw, // can customize height

                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBE2EC)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: controller.firstNamecontroller,
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
                            contentPadding: const EdgeInsets.only(bottom: 12, top: 0.0), // this can adjust the label and text position
                            //or transparent
                          ),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                      Container(
                        height: 0.07.sh,
                        width: 0.42.sw, // can customize height

                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBE2EC)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: controller.lastNamecontroller,
                          decoration: InputDecoration(
                            hintText: 'Last Name',

                            prefixIcon: Image.asset(
                              ImageAssets.firstname,
                              scale: 1.1,
                            ),
                            hintStyle: const TextStyle(
                              color: Color(0xffA5A5A5),
                              fontSize: 15.0,
                              letterSpacing: 0,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(bottom: 12, top: 0.0), // this can adjust the label and text position
                            //or transparent
                          ),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Container(
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
                            scale: 2,
                          ),
                        ),
                        hintText: 'Select Gender',
                        hintStyle: const TextStyle(
                          color: Color(0xffA5A5A5),
                        ), // Use hintText instead of labelText
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(bottom: 0, top: 7.0),
                      ),
                      value: controller.selectedGender,
                      icon: const SizedBox.shrink(),
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(
                                  gender,
                                  style: const TextStyle(color: Color(0xffA5A5A5)),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.selectedGender = value;
                      },
                    ),
                  ),
                  20.verticalSpace,
                  LabelTextFormFieldWidget(
                    controller: controller.dateController,
                    height: 50,
                    labeltext: 'Date of Birth',
                    readOnly: true,
                    issufficsenable: true,
                    suffixicon: ImageAssets.smallcalendar,
                    ontap: () {
                      controller.selectDate(context);
                    },
                  ),
                  20.verticalSpace,
                  LabelTextFormFieldWidget(
                    height: 50,
                    controller: controller.addresscontroller,
                    labeltext: 'Address',
                    issufficsenable: false,
                    ontap: () {
                      // controller.selectDate(context);
                    },
                  ),
                  20.verticalSpace,
                  LabelTextFormFieldWidget(
                    controller: cotnroller.locationcontroller,
                    height: 50,
                    labeltext: 'Location',
                    issufficsenable: true,
                    suffixicon: ImageAssets.userlocation,
                    ontap: () {
                      // controller.selectDate(context);
                    },
                  ),
                  20.verticalSpace,
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
                          target: LatLng(double.parse(controller.userdata.userDetails!.latitude.toString()),
                              double.parse(controller.userdata.userDetails!.longitude.toString())),
                          zoom: 5,
                        ),
                        onTap: (latLng) async {
                          LatLng? result = await Get.to(() => ShowMapScreen(
                              initialLocation: LatLng(double.parse(controller.userdata.userDetails!.latitude.toString()),
                                  double.parse(controller.userdata.userDetails!.longitude.toString()))));

                          if (result != null) {
                            cotnroller.lat = result.latitude;
                            cotnroller.long = result.longitude;
                            List<Placemark> placemarks = await placemarkFromCoordinates(result.latitude, result.longitude);
                            if (placemarks.isNotEmpty) {
                              Placemark placemark = placemarks.first;
                              String address = "${placemark.name}, ${placemark.locality}";
                              cotnroller.locationcontroller.text = address;
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  LabelTextFormFieldWidget(
                    maxlines: 5,
                    labeltext: 'About',
                    controller: controller.aboutcontroller,
                    issufficsenable: false,
                    ontap: () {
                      // _selectDate(context);
                    },
                  ),
                  20.verticalSpace,
                  Container(
                    height: 0.07.sh,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffDBE2EC)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: controller.emailcontroller,
                      enabled: false,
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
                        contentPadding: const EdgeInsets.only(bottom: 13, top: 0.0), // this can adjust the label and text position
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
                      title: 'Save',
                      onPress: () {
                        controller.validateData();
                      }),
                  30.verticalSpace
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
