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
  String? selectedHours = '00';
  String? selectedMints = '00';
  RxString state = "".obs;
  RxString city = "".obs;
  RxInt stepIndex = 0.obs;
  RxInt groupValue = 0.obs;
  RxInt cardvalue = 0.obs;
  RxInt workingHour = 0.obs;
  RxInt fixedAmoount = 0.obs;
  RxBool isAm = false.obs;
  RxString selectedTimeWithDate = "".obs;
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');
  TextEditingController dateController = TextEditingController();
  File? image;
  List listOfImages = [];
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      listOfImages.add(image);
      update();
    } else {}
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

      dateController.text = picked.toIso8601String(); // Format the date

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
