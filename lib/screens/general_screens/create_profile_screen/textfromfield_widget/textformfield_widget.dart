// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/color_utils.dart';

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
        border: Border.all(color: Color(0xffDBE2EC)),
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
                    scale: 1.1,
                  ))
              : null,
          hintText: labeltext,
          hintStyle: TextStyle(
            color: Color(0xffA5A5A5),
            fontSize: 16.0,
            letterSpacing: 0,
          ),
          border: InputBorder.none,

          contentPadding: EdgeInsets.only(
              bottom: issufficsenable ? 10 : 15,
              top: maxlines > 1
                  ? 10
                  : 0.0), // this can adjust the label and text position
          filled: true,
          fillColor: Colors.transparent, //or transparent
        ),
        textAlignVertical: TextAlignVertical.bottom,
      ),
    );
  }
}
