// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_saviors/resources/components/bottom_navbar.dart';
import 'package:local_saviors/resources/components/p_bottom_nav_bar.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import '../../../resources/components/back_appbar_button.dart';
import '../../../resources/components/text_fields.dart';
import '../../../utils/images/image_assets.dart';
import '../create_profile_screen/create_profile_screen.dart';
import '../forget_password_screen/forget_password.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                'Welcome Back',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              20.verticalSpace,
              Text(
                'Sign in to Continue!',
                style: TextStyle(
                  fontSize: 15,
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
                icon: ImageAssets.password,
                scale: 1,
                hintColor: Color(0xffA5A5A5),
              ),
              20.verticalSpace,
              RoundButton(
                  buttonColor: Color(0xffE50000),
                  height: 40,
                  width: 0.9.sw,
                  title: 'Sign In',
                  onPress: () {
                    // Get.toNamed(RouteName.homeScreenPath);
                    role.value == "user"
                        ? Get.to(() => NavbarScreen())
                        : Get.to(PBottomNavBar());
                  }),
              30.verticalSpace,
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text(
                    'Forgot your Password?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              120.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.to(() => SignupScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t have an account?',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Colors.black),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      'Sign Up',
                      style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: ColorUtils.red,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
