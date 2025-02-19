// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/constant.dart';

class CreateProfileController extends GetxController {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController emailcontroller =
      TextEditingController(text: email.value);
  TextEditingController phonecontroller = TextEditingController();
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
}
