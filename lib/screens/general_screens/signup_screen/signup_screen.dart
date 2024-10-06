// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/otp_verifiation_screen.dart/otp_verification.dart';
import 'package:local_saviors/utils/constant.dart';
import '../../../resources/components/back_appbar_button.dart';
import '../../../resources/components/text_fields.dart';
import '../../../utils/images/image_assets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              110.verticalSpace,
              Center(
                child: Image.asset(
                  ImageAssets.coloredlogo,
                  scale: 3.5,
                ),
              ),
              50.verticalSpace,
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              20.verticalSpace,
              Text(
                'Create New Account!',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              20.verticalSpace,
              Container(
                color: Colors.red,
                height: 5,
                width: 50,
              ),
              40.verticalSpace,
              AuthTextField(
                hint: 'Email Address / Phone Number',
                icon: ImageAssets.emailname,
                scale: 1,
                hintColor: Color(0xffA5A5A5),
              ),
              20.verticalSpace,
              AuthTextField(
                hint: 'Password',
                icon: ImageAssets.lockIcon,
                scale: 1.7,
                hintColor: Color(0xffA5A5A5),
              ),
              20.verticalSpace,
              AuthTextField(
                hint: 'Confirm Password',
                icon: ImageAssets.lockIcon,
                scale: 1.7,
                hintColor: Color(0xffA5A5A5),
              ),
              50.verticalSpace,
              RoundButton(
                  buttonColor: Color(0xffE50000),
                  height: 40,
                  width: 0.9.sw,
                  title: 'Sign Up',
                  onPress: () {
                    isProfileCreated = true;
                    Get.to(() => OtpVerificationScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}