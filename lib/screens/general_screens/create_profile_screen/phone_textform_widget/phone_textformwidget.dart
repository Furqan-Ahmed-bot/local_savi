// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phoneTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? phonecontroller;
  const phoneTextFormFieldWidget({
    this.phonecontroller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.9.sw,
      height: 0.07.sh,
      child: IntlPhoneField(
        showCountryFlag: true,
        controller: phonecontroller,
        dropdownIconPosition: IconPosition.trailing,
        initialCountryCode: 'US',
        autofocus: false,
        dropdownTextStyle: Theme.of(context).textTheme.bodyMedium,
        pickerDialogStyle: PickerDialogStyle(
          backgroundColor: Colors.white,
          countryNameStyle: Theme.of(context).textTheme.bodyMedium,
          countryCodeStyle: Theme.of(context).textTheme.bodyMedium,
          searchFieldInputDecoration: InputDecoration(
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.search),
          ),
        ),
        flagsButtonMargin: const EdgeInsets.symmetric(horizontal: 10),
        disableLengthCheck: true,
        dropdownDecoration: BoxDecoration(
          color: Colors.transparent,
          border: BorderDirectional(
            end: BorderSide(color: Color(0xffDBE2EC)),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black,
            ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Color(0xffDBE2EC),
            ), // Adjust the color as needed
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Color(0xffDBE2EC),
            ),
          ),
          hintText: 'Enter Phone Number',
          hintStyle: TextStyle(color: Color(0xffA5A5A5)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 71, 101, 143),
            ), // Adjust the color as needed
          ),
        ),
        languageCode: "en",
        onChanged: (phone) {
          // controller.countryCode =
          //     phone.countryCode.toString();
          // print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          print('Country changed to: ' + country.name);
        },
      ),
    );
  }
}
