import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class CreateJobPostScreenController extends GetxController {
  GlobalKey formKey = GlobalKey();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController locationEditingController = TextEditingController();
  TextEditingController priceBudgetEditingController = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

  String? selectedHours = '00';
  String? selectedMints = '00';
  RxString state = "".obs;
  RxString city = "".obs;
  RxInt stepIndex = 0.obs;
  RxInt groupValue = 0.obs;
  RxInt cardvalue = 0.obs;
  RxInt workingHour = 0.obs;
  RxInt fixedAmoount = 0.obs;
  var selectedJobDate;

  var latitide;
  var longitude;
  RxBool isAm = false.obs;
  RxString selectedTimeWithDate = "".obs;
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');
  TextEditingController dateController = TextEditingController();
  File? image;
  List listOfImages = [];
  final picker = ImagePicker();
  // Future getImage() async {
  //   final pickedFile = await picker.pickMultiImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //     listOfImages.add(image);
  //     update();
  //   } else {}
  // }

  Future getImage() async {
    final picker = ImagePicker();

    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      for (var file in pickedFiles) {
        listOfImages.add(File(file.path));
        update();
      }
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
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 100),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectedJobDate = selectedDate.toString();
      dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);

      update();
    }
  }

  bool isTimeValid(DateTime selectedDate, String selectedHours, String selectedMints, bool isAm) {
    DateTime now = DateTime.now();

    // Convert selected hours to 24-hour format based on AM/PM
    int hours = int.parse(selectedHours);
    if (!isAm && hours != 12) {
      hours += 12; // Convert to 24-hour format for PM
    } else if (isAm && hours == 12) {
      hours = 0; // 12 AM is 00:00 in 24-hour format
    }

    DateTime selectedTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      hours,
      int.parse(selectedMints),
    );

    // If the selected date is today, check if the selected time is after the current time
    if (selectedDate.year == now.year && selectedDate.month == now.month && selectedDate.day == now.day) {
      return selectedTime.isAfter(now);
    }

    // If the selected date is in the future, the time is always valid
    return true;
  }

  List ListOfText = [
    // {
    //   "title": "Wallet",
    //   "image": ImageAssets.drawerWallet,
    // },
    {
      "title": "Google Pay",
      "image": ImageAssets.googlePay,
    },
    {
      "title": "Apple Pay",
      "image": ImageAssets.applePay,
    },
    {
      "title": "PayPal",
      "image": ImageAssets.paypal,
    },
    {
      "title": "**** **** **** 6592",
      "image": ImageAssets.masterCard,
    },
  ];
}
