// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/constant.dart';

import '../../../utils/api_services/user_services.dart';
import '../../../utils/color_utils.dart';

class CreateProfileController extends GetxController {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController(text: email.value);
  TextEditingController phonecontroller = TextEditingController();
  var latitide;
  var longitude;
  RxString state = "".obs;
  RxString city = "".obs;
  String selectedGender = 'Male';
  List<String> gender = ['Male', 'Female'];
  File? image;
  final picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {}
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950, 8),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Customize the theme here
            primaryColor: Colors.red, // Change primary color
            //accentColor: Colors.green, // Change accent color
            // colorScheme:
            //     ColorScheme.light(primary: themecolor), // Change color scheme
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      datecontroller.text = myFormat.format(selectedDate);
      update();
    }
  }

  validation(context) {
    if (image == null) {
      return Get.snackbar("Alert", "Please select image", backgroundColor: ColorUtils.white);
    }
    if (firstNamecontroller.text.isEmpty) {
      return Get.snackbar("Alert", "Please Enter First Name", backgroundColor: ColorUtils.white);
    }
    if (lastNamecontroller.text.isEmpty) {
      return Get.snackbar("Alert", "Please Enter Last Name", backgroundColor: ColorUtils.white);
    }
    if (datecontroller.text.isEmpty) {
      return Get.snackbar("Alert", "Please select Date Of Birth", backgroundColor: ColorUtils.white);
    }
    if (addresscontroller.text.isEmpty) {
      return Get.snackbar("Alert", "Please Enter Address", backgroundColor: ColorUtils.white);
    }
    if (latitide == null) {
      return Get.snackbar("Alert", "Please Select Location ", backgroundColor: ColorUtils.white);
    }

    if (aboutcontroller.text.isEmpty) {
      return Get.snackbar("Alert", "About Should Not Be Empty", backgroundColor: ColorUtils.white);
    }
    if (phonecontroller.text.isEmpty) {
      return Get.snackbar("Alert", "Please Enter Phone Number", backgroundColor: ColorUtils.white);
    }
    try {
      if (role.value == 'USER') {
        UserServices().createProfileService(
            context: context,
            address: addresscontroller.text,
            gender: selectedGender,
            dob: selectedDate.toString(),
            phone: phonecontroller.text,
            email: emailcontroller.text,
            firstName: firstNamecontroller.text,
            lastName: lastNamecontroller.text,
            country: "US",
            state: state.value,
            city: city.value,
            latitude: latitide,
            longitude: longitude,
            about: aboutcontroller.text,
            image: image!.path.toString());
      } else {
        UserServices().createJobPerformerProfile(
          context: context,
          address: addresscontroller.text,
          gender: selectedGender,
          dob: selectedDate.toString(),
          phone: phonecontroller.text,
          email: emailcontroller.text,
          firstName: firstNamecontroller.text,
          lastName: lastNamecontroller.text,
          country: "US",
          state: state.value,
          city: city.value,
          about: aboutcontroller.text,
          image: image!.path.toString(),
          workertype: role.value,
        );
      }
    } catch (e) {
      Get.snackbar("Error", "${e}", backgroundColor: ColorUtils.white);
    }
  }
}
