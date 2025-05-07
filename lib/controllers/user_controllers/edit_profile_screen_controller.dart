// ignore_for_file: prefer_if_null_operators

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/models/job_provider_model/job_provider_model.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';

class EditProfileScreenController extends GetxController {
  JobProviderModel userdata = JobProviderModel();
  PerformerModel performerdata = PerformerModel();
  String? selectedGender = 'Male';
  TextEditingController datecontroller = TextEditingController();
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  void onInit() {
    if (role.value == "USER") {
      userdata = Get.arguments['data'];
      firstNamecontroller.text = userdata.userDetails!.firstName.toString();
      lastNamecontroller.text = userdata.userDetails!.lastName.toString();
      addresscontroller.text = userdata.userDetails!.address.toString();
      locationcontroller.text = userdata.userDetails!.location.toString();
      aboutcontroller.text = userdata.userDetails!.description.toString();
      emailcontroller.text = userdata.userDetails!.contactEmail.toString();

      selectedDate = DateTime.parse(userdata.userDetails!.dateOfBirth.toString());
      dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      phonecontroller.text = "5215577668";
    } else {
      performerdata = Get.arguments['data'];
      firstNamecontroller.text = performerdata.userDetails!.firstName.toString();
      lastNamecontroller.text = performerdata.userDetails!.lastName.toString();
      addresscontroller.text = performerdata.userDetails!.address.toString();
      locationcontroller.text = performerdata.userDetails!.location.toString();
      aboutcontroller.text = performerdata.userDetails!.description.toString();
      emailcontroller.text = performerdata.userDetails!.contactEmail.toString();

      selectedDate = DateTime.parse(performerdata.userDetails!.dateOfBirth.toString());
      dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      phonecontroller.text = "5215577668";
    }

    update();

    super.onInit();
  }

  List<String> gender = ['Male', 'Female'];
  RxString state = "".obs;
  RxString city = "".obs;
  File? image;
  final picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');
  TextEditingController dateController = TextEditingController();
  var lat;
  var long;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    update();
  }

  // validateData() async {
  //   if (firstNamecontroller.text.isNotEmpty) {
  //     if (lastNamecontroller.text.isNotEmpty) {
  //       if (addresscontroller.text.isNotEmpty) {
  //         if (aboutcontroller.text.isNotEmpty) {
  //           if (phonecontroller.text.isNotEmpty) {
  //             if (role.value == "USER") {
  //               if (image != null) {
  //                 await UserServices.instance.updateUserProfilePic(context: Get.context, image: image!.path.toString()).then((value) async {
  //                   await UserServices.instance.editUserService(
  //                       about: aboutcontroller.text,
  //                       firstName: firstNamecontroller.text,
  //                       lastName: lastNamecontroller.text,
  //                       gender: selectedGender,
  //                       dob: selectedDate.toIso8601String(),
  //                       address: addresscontroller.text,
  //                       location: locationcontroller.text,
  //                       lat: lat != null ? lat : userdata.userDetails!.latitude,
  //                       long: long != null ? long : userdata.userDetails!.longitude,
  //                       email: emailcontroller.text,
  //                       phone: phonecontroller.text,
  //                       context: Get.context);
  //                 });
  //               } else {
  //                 await UserServices.instance.editUserService(
  //                     about: aboutcontroller.text,
  //                     firstName: firstNamecontroller.text,
  //                     lastName: lastNamecontroller.text,
  //                     gender: selectedGender,
  //                     dob: selectedDate.toIso8601String(),
  //                     address: addresscontroller.text,
  //                     location: locationcontroller.text,
  //                     lat: lat != null ? lat : userdata.userDetails!.latitude,
  //                     long: long != null ? long : userdata.userDetails!.longitude,
  //                     email: emailcontroller.text,
  //                     phone: phonecontroller.text,
  //                     context: Get.context);
  //               }
  //             } else {
  //               if (image != null) {
  //                 await UserServices.instance.updateUserProfilePic(context: Get.context, image: image!.path.toString()).then((value) async {
  //                   await UserServices.instance.editUserService(
  //                       about: aboutcontroller.text,
  //                       firstName: firstNamecontroller.text,
  //                       lastName: lastNamecontroller.text,
  //                       gender: selectedGender,
  //                       dob: selectedDate.toIso8601String(),
  //                       address: addresscontroller.text,
  //                       location: locationcontroller.text,
  //                       lat: lat != null ? lat : phController.performerdata.userDetails!.latitude,
  //                       long: long != null ? lat : phController.performerdata.userDetails!.longitude,
  //                       email: emailcontroller.text,
  //                       phone: phonecontroller.text,
  //                       context: Get.context);
  //                 });
  //               } else {
  //                 await UserServices.instance.editUserService(
  //                     about: aboutcontroller.text,
  //                     firstName: firstNamecontroller.text,
  //                     lastName: lastNamecontroller.text,
  //                     gender: selectedGender,
  //                     dob: selectedDate.toIso8601String(),
  //                     address: addresscontroller.text,
  //                     location: locationcontroller.text,
  //                     lat: lat != null ? lat : phController.performerdata.userDetails!.latitude,
  //                     long: long != null ? lat : phController.performerdata.userDetails!.longitude,
  //                     email: emailcontroller.text,
  //                     phone: phonecontroller.text,
  //                     context: Get.context);
  //               }
  //             }
  //           } else {
  //             Get.snackbar("Alert", "Please add phone number", backgroundColor: ColorUtils.white);
  //           }
  //         } else {
  //           Get.snackbar("Alert", "Please add description", backgroundColor: ColorUtils.white);
  //         }
  //       } else {
  //         Get.snackbar("Alert", "Please add address", backgroundColor: ColorUtils.white);
  //       }
  //     } else {
  //       Get.snackbar("Alert", "Please add your last name", backgroundColor: ColorUtils.white);
  //     }
  //   } else {
  //     Get.snackbar("Alert", "Please add your first name", backgroundColor: ColorUtils.white);
  //   }
  // }

  validateData(context) async {
    // Validate all required fields first
    if (firstNamecontroller.text.isEmpty) {
      Get.snackbar("Alert", "Please add your first name", backgroundColor: ColorUtils.white);
      return;
    }

    if (lastNamecontroller.text.isEmpty) {
      Get.snackbar("Alert", "Please add your last name", backgroundColor: ColorUtils.white);
      return;
    }

    if (addresscontroller.text.isEmpty) {
      Get.snackbar("Alert", "Please add address", backgroundColor: ColorUtils.white);
      return;
    }

    if (aboutcontroller.text.isEmpty) {
      Get.snackbar("Alert", "Please add description", backgroundColor: ColorUtils.white);
      return;
    }

    if (phonecontroller.text.isEmpty) {
      Get.snackbar("Alert", "Please add phone number", backgroundColor: ColorUtils.white);
      return;
    }

    // Prepare common parameters
    final params = {
      'about': aboutcontroller.text,
      'firstName': firstNamecontroller.text,
      'lastName': lastNamecontroller.text,
      'gender': selectedGender,
      'dob': selectedDate.toIso8601String(),
      'address': addresscontroller.text,
      'location': locationcontroller.text,
      'email': emailcontroller.text,
      'phone': phonecontroller.text,
      'context': Get.context,
    };

    // Add latitude/longitude based on user role
    if (role.value == "USER") {
      params['lat'] = lat ?? userdata.userDetails!.latitude;
      params['long'] = long ?? userdata.userDetails!.longitude;
    } else {
      params['lat'] = lat ?? phController.performerdata.userDetails!.latitude;
      params['long'] = long ?? phController.performerdata.userDetails!.longitude;
    }

    try {
      // Handle image upload if present
      if (image != null) {
        await UserServices.instance.updateUserProfilePic(context: Get.context, image: image!.path.toString());
      }

      // Update user data
      await UserServices.instance.editUserService(
        about: params['about'],
        firstName: params['firstName'],
        lastName: params['lastName'],
        gender: params['gender'],
        dob: params['dob'],
        address: params['address'],
        location: params['location'],
        lat: params['lat'],
        long: params['long'],
        email: params['email'],
        phone: params['phone'],
        context: context,
      );
    } catch (e) {
      // Handle any errors that might occur during the process
      Get.snackbar("Error", "Failed to update profile: ${e.toString()}", backgroundColor: ColorUtils.white);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.black,
              background: ColorUtils.white,
              onPrimary: ColorUtils.white,
              onSurface: ColorUtils.black,
            ),
            dividerColor: ColorUtils.black,
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = myFormat.format(selectedDate); // Format the date
      update();
    }
  }
}
