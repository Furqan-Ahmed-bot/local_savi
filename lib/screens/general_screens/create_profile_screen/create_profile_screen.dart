// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/otp_verifiation_screen.dart/otp_verification.dart';
import 'package:local_saviors/utils/color_utils.dart';
import '../../../resources/components/back_appbar_button.dart';
import '../../../resources/components/drop_down_widget.dart';
import '../../../resources/components/text_fields.dart';
import '../../../utils/images/image_assets.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  TextEditingController _datecontroller = new TextEditingController();

  List<String> gender = ['Male', 'Female'];
  File? _image;
  final picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
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
            primaryColor: Colors.purple, // Change primary color
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
      setState(() {
        selectedDate = picked;
        _datecontroller.text = myFormat.format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButtonWidget(
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD6EFFF), // Light blue shade for the top
              Color(0xFFFFFFFF), // White shade for the bottom
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                110.verticalSpace,
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorUtils.red, width: 8),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                          child: _image == null
                              ? Image.asset(ImageAssets.oliverImg)
                              : null,
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 0,
                        child: GestureDetector(
                          onTap: getImage,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 45, 85, 118),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 0.07.sh,
                      width: 0.44.sw, // can customize height
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'First Name',

                          labelStyle: TextStyle(
                            color: ColorUtils.red,
                            fontSize: 15.0,
                            letterSpacing: 0,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                              bottom: 14,
                              top:
                                  0.0), // this can adjust the label and text position
                          filled: true,
                          fillColor: Colors.transparent, //or transparent
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                      ),
                    ),
                    Container(
                      height: 0.07.sh,
                      width: 0.44.sw, // can customize height
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'First Name',

                          labelStyle: TextStyle(
                            color: ColorUtils.red,
                            fontSize: 15.0,
                            letterSpacing: 0,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                              bottom: 14,
                              top:
                                  0.0), // this can adjust the label and text position
                          filled: true,
                          fillColor: Colors.transparent, //or transparent
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                      ),
                    ),
                  ],
                ),
                40.verticalSpace,
                LabelTextFormFieldWidget(
                  controller: _datecontroller,
                  height: 60,
                  labeltext: 'Date of Birth',
                  issufficsenable: true,
                  suffixicon: ImageAssets.appleicon,
                  ontap: () {
                    _selectDate(context);
                  },
                ),
                40.verticalSpace,
                MyDropdownWidget(
                  title: 'Select Gender',
                  onChanged: (value) {},
                  options: gender,
                  selectedValue: 'Male',
                ),
                20.verticalSpace,
                AuthTextField(
                  hintColor: Color(0xffA5A5A5),
                  hint: 'Address',
                  label: '',
                ),
                AuthTextField(
                  hintColor: Color(0xffA5A5A5),
                  maxLine: 5,
                  hint: 'About',
                  label: '',
                ),
                RoundButton(
                    buttonColor: Color(0xffE50000),
                    height: 40,
                    width: 0.9.sw,
                    title: 'Continue',
                    onPress: () {
                      Get.to(() => OtpVerificationScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LabelTextFormFieldWidget extends StatelessWidget {
  LabelTextFormFieldWidget({
    this.height = 100,
    this.width = 200,
    this.controller,
    this.labeltext = 'Label text',
    this.suffixicon,
    this.issufficsenable = false,
    this.maxlines = 1,
    this.ontap,
    this.onChange,
    this.onSubmitted,
    super.key,
  });
  double height;
  double width;
  final TextEditingController? controller;
  String labeltext;
  bool issufficsenable;
  final suffixicon;
  int maxlines;
  final Function()? ontap;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // can customize height
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        onFieldSubmitted: onSubmitted,
        onChanged: onChange,
        controller: controller,
        maxLines: maxlines,
        decoration: InputDecoration(
          suffixIcon: issufficsenable
              ? InkWell(
                  onTap: ontap,
                  child: Image.asset(
                    suffixicon,
                    scale: 1.4,
                  ))
              : null,
          labelText: labeltext,
          labelStyle: TextStyle(
            color: ColorUtils.red,
            fontSize: 18.0,
            letterSpacing: 0,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
              bottom: 8,
              top: 0.0), // this can adjust the label and text position
          filled: true,
          fillColor: Colors.transparent, //or transparent
        ),
        textAlignVertical: TextAlignVertical.bottom,
      ),
    );
  }
}
