// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/professional_controllers/payment_method_controller.dart';
import '../../resources/components/round_button.dart';
import '../../utils/color_utils.dart';

class AddNewBankScreen extends StatefulWidget {
  const AddNewBankScreen({super.key});

  @override
  State<AddNewBankScreen> createState() => _AddNewBankScreenState();
}

class _AddNewBankScreenState extends State<AddNewBankScreen> {
  var cont = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RoundButton(
        isBorderEnable: false,
        width: 0.9.sw,
        title: 'Add',
        onPress: () {
          // Get.back();
          cont.validate(context);
        },
        buttonColor: ColorUtils.red,
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorUtils.red,
              size: 20,
            )),
        title: Text(
          'Add Bank',
          style: TextStyle(color: ColorUtils.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorUtils.primary, // Light blue shade for the top
              ColorUtils.white, // White shade for the bottom
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              120.verticalSpace,
              Text(
                'Account Number',
                style: TextStyle(color: ColorUtils.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              10.verticalSpace,
              Container(
                height: 55,
                child: TextFormField(
                  controller: cont.AccountNumberController,
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.5), // Set transparent grey color
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.0.w),

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
                style: TextStyle(color: ColorUtils.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              10.verticalSpace,
              Container(
                height: 55,
                child: TextFormField(
                  controller: cont.RoutingNumberController,
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.5), // Set transparent grey color
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.0.w),

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
      ),
    );
  }
}
