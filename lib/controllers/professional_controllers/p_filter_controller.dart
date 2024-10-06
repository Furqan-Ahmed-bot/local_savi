// ignore_for_file: unnecessary_new, prefer_final_fields, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PFilterController extends GetxController {
  RxBool isAm = false.obs;
  RxDouble startDistance = 20.0.obs;
  RxDouble endDistance = 50.0.obs;
  RxDouble startPrice = 150.0.obs;
  RxDouble endPrice = 200.0.obs;
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');
  var dateController = TextEditingController().obs;

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
      dateController.value.text = myFormat.format(selectedDate);
    }
  }
}
