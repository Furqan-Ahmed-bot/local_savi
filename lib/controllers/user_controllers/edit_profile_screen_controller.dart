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
      phonecontroller.text = "521557766889";
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
      phonecontroller.text = "521557766889";
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

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    update();
  }

  validateData() async {
    if (firstNamecontroller.text.isNotEmpty) {
      if (lastNamecontroller.text.isNotEmpty) {
        if (addresscontroller.text.isNotEmpty) {
          if (aboutcontroller.text.isNotEmpty) {
            if (phonecontroller.text.isNotEmpty) {
              if (image != null) {
                await UserServices.instance.updateUserProfilePic(context: Get.context, image: image!.path.toString()).then((value) async {
                  if (value) {
                    await UserServices.instance.editUserService(
                        about: aboutcontroller.text,
                        firstName: firstNamecontroller.text,
                        lastName: lastNamecontroller.text,
                        gender: selectedGender,
                        dob: selectedDate.toIso8601String(),
                        address: addresscontroller.text,
                        location: locationcontroller.text,
                        lat: "23.2323",
                        long: "68.6868",
                        email: emailcontroller.text,
                        phone: phonecontroller.text,
                        context: Get.context);
                  }
                });
              } else {
                await UserServices.instance.editUserService(
                    about: aboutcontroller.text,
                    firstName: firstNamecontroller.text,
                    lastName: lastNamecontroller.text,
                    gender: selectedGender,
                    dob: selectedDate.toIso8601String(),
                    address: addresscontroller.text,
                    location: locationcontroller.text,
                    lat: "23.2323",
                    long: "68.6868",
                    email: emailcontroller.text,
                    phone: phonecontroller.text,
                    context: Get.context);
              }
            } else {
              Get.snackbar("Alert", "Please add phone number", backgroundColor: ColorUtils.white);
            }
          } else {
            Get.snackbar("Alert", "Please add description", backgroundColor: ColorUtils.white);
          }
        } else {
          Get.snackbar("Alert", "Please add address", backgroundColor: ColorUtils.white);
        }
      } else {
        Get.snackbar("Alert", "Please add your last name", backgroundColor: ColorUtils.white);
      }
    } else {
      Get.snackbar("Alert", "Please add your first name", backgroundColor: ColorUtils.white);
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
