// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/validations.dart';

import '../../../resources/components/imagepicker_component.dart';
import '../../../utils/api_services/user_services.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';
import 'create_handyman_profile_controller.dart';
import 'create_profile__two_controller.dart';
import 'package:path_provider/path_provider.dart';

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
  final createProfileTwoController = Get.put(CreatePorfileTwoController());
  final createHandyManProfileController =
      Get.put(CreateHandymanPorfileController());
  final imagePickerController = Get.put(ImagePickerController());
  var latitide;
  var longitude;
  RxString state = "".obs;
  RxString city = "".obs;
  String? selectedGender;
  List<String> gender = ['Gender' 'Male', 'Female'];
  File? image;
  final picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('DD/MM/yyyy');
  final formKey = GlobalKey<FormState>();
  RxBool isValidate = false.obs;

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
      print(datecontroller.text);
      update();
    }
  }

  validation(context) async {
    isValidate.value = true;
    if (validateInputs(formKey: formKey)) {
      FocusScope.of(Get.context!).unfocus();

      if (phonecontroller.text.isEmpty) {
        return Get.snackbar("Alert", "Please Enter Phone Number",
            backgroundColor: ColorUtils.white);
      }
      if (selectedGender == null) {
        return Get.snackbar("Alert", "Please Select Gender",
            backgroundColor: ColorUtils.white);
      }

      File imageFile;
      if (image != null) {
        imageFile = image!;
      } else {
        // Load placeholder from assets and write to temporary file
        final byteData =
            await rootBundle.load('assets/images/placeholderImg.png');
        final tempDir = await getTemporaryDirectory();
        final tempFile = File('${tempDir.path}/placeholderImg.png');
        await tempFile.writeAsBytes(byteData.buffer.asUint8List());
        imageFile = tempFile;
      }
      try {
        if (role.value == 'USER') {
          UserServices.instance.createProfileService(
              context: context,
              address: addresscontroller.text,
              gender: selectedGender!,
              dob: selectedDate.toIso8601String(),
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
              image: imageFile.path.toString());
        } else {
          if (role.value == 'PROFESSIONAL') {
            Get.toNamed(RouteName.cretaetProfileTwoPath);
            if (createProfileTwoController.professionIds.isEmpty) {
              return Get.snackbar("Alert", "Please Select Profession",
                  backgroundColor: ColorUtils.white);
            } else {
              UserServices.instance.createJobPerformerProfile(
                  context: context,
                  address: addresscontroller.text,
                  gender: selectedGender!,
                  dob: selectedDate.toString(),
                  phone: phonecontroller.text,
                  email: emailcontroller.text,
                  firstName: firstNamecontroller.text,
                  lastName: lastNamecontroller.text,
                  country: "US",
                  state: state.value,
                  city: city.value,
                  about: aboutcontroller.text,
                  image: imageFile.path.toString(),
                  workertype: role.value,
                  lat: latitide,
                  long: longitude,
                  professionIds: createProfileTwoController.professionIds,
                  categoryIds: createHandyManProfileController.professionIds,
                  documents: imagePickerController.selectedImages.value);
            }
          } else {
            Get.toNamed(RouteName.createHandyManProfilePath);
            if (createHandyManProfileController.professionIds.isEmpty) {
              return Get.snackbar("Alert", "Please Select Categories",
                  backgroundColor: ColorUtils.white);
            } else {
              UserServices.instance.createJobPerformerProfile(
                  context: context,
                  address: addresscontroller.text,
                  gender: selectedGender!,
                  dob: selectedDate.toString(),
                  phone: phonecontroller.text,
                  email: emailcontroller.text,
                  firstName: firstNamecontroller.text,
                  lastName: lastNamecontroller.text,
                  country: "US",
                  state: state.value,
                  city: city.value,
                  about: aboutcontroller.text,
                  image: imageFile.path.toString(),
                  workertype: role.value,
                  lat: latitide,
                  long: longitude,
                  professionIds: createProfileTwoController.professionIds,
                  categoryIds: createHandyManProfileController.professionIds);
            }
          }
        }
      } catch (e) {
        Get.snackbar("Error", "${e}", backgroundColor: ColorUtils.white);
      }
    }
  }
}
