import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/color_utils.dart';

class EditProfileScreenController extends GetxController {
  String? selectedGender = 'Male';
  String? selectedCity = 'City 1';
  String? selectedState = 'State 1';
  List<String> gender = ['Male', 'Female'];
  File? image;
  final picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');
  TextEditingController dateController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {}
    update();
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
      lastDate: DateTime(DateTime.now().year + 100),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = myFormat.format(selectedDate); // Format the date
      update();
    }
  }
}
