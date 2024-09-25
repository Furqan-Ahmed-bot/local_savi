// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_saviors/utils/color_utils.dart';

class MyDropdownWidget extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final String title;
  final Function(String) onChanged;
  const MyDropdownWidget({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // can customize height
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        //dropdownColor: AppColor.whiteColor,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
          size: 27,
          color: Colors.black,
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          labelText: title,
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
        value: selectedValue,
        items: options
            .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        onChanged: (s) => onChanged(s!),
      ),
    );
  }
}
