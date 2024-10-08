import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class CreateJobPostScreenController extends GetxController {
  String? selectedTime = '00';
  String? selectedHour = '00';
  String? selectedCity = 'City 1';
  String? selectedState = 'State 1';
  RxInt stepIndex = 0.obs;
  RxInt groupValue = 0.obs;
  RxInt cardvalue = 0.obs;
  RxInt workingHour = 0.obs;
  RxInt fixedAmoount = 0.obs;
  RxBool isAm = false.obs;
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');
  TextEditingController dateController = TextEditingController();

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
