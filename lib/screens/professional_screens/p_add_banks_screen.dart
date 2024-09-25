// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import '../../controllers/professional_controllers/add_funds_controller.dart';
import '../../resources/components/round_button.dart';
import '../../utils/color_utils.dart';

class AddBanksScreen extends GetWidget<AddFundsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RoundButton(
        title: 'Confirm',
        onPress: () {
          Get.back();
        },
        width: 0.9.sw,
        buttonColor: ColorUtils.red,
        height: 50,
      ),
      body: myBackGround(
          child: Column(
        children: [
          appbar(
            isMenu: false,
            title: "My Wallet",
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.055.sw,
              vertical: 30.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Bank',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                20.verticalSpace,
                Container(
                  height: 55,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white
                          .withOpacity(0.5), // Set transparent grey color
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 25.0.w),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none // No border side
                          ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Account Number',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                10.verticalSpace,
                Container(
                  height: 55,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white
                          .withOpacity(0.5), // Set transparent grey color
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 25.0.w),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none, // No border side
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Routing Number',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                10.verticalSpace,
                Container(
                  height: 55,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white
                          .withOpacity(0.5), // Set transparent grey color
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 25.0.w),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none, // No border side
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
