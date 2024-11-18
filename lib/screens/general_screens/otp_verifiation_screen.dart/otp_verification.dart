// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, use_full_hex_values_for_flutter_colors, avoid_print, prefer_const_constructors_in_immutables

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/otp_verifiation_screen.dart/otp_verification_controller.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../resources/components/back_appbar_button.dart';
import '../../../utils/images/image_assets.dart';

class OtpVerificationScreen extends GetWidget<OtpVerificationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpVerificationController>(builder: (controller) {
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
          body: SingleChildScrollView(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: 1.0.sh,
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
                        'Verification?',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      20.verticalSpace,
                      Text(
                        'We have sent you an email containing 6 digits verification code. Please enter the code to verify your identity',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      20.verticalSpace,
                      Container(
                        color: ColorUtils.red,
                        height: 5,
                        width: 50,
                      ),
                      40.verticalSpace,
                      SizedBox(
                        width: Get.width,
                        child: OtpPinField(
                          key: controller.otpPinFieldController,
                          textInputAction: TextInputAction.done,
                          autoFocus: false,
                          keyboardType: TextInputType.number,
                          onSubmit: (text) {
                            controller.otpPin.value = text;
                          },
                          onChange: (text) {
                            print('Enter on change pin is $text');

                            /// return the entered pin
                          },
                          onCodeChanged: (code) {
                            print('onCodeChanged  is $code');
                          },
                          otpPinFieldStyle: OtpPinFieldStyle(
                              textStyle: TextStyle(
                                // fontFamily: Font.Medium,
                                fontSize: 22.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              fieldBorderWidth: 1,
                              activeFieldBackgroundColor: ColorUtils.white,
                              defaultFieldBackgroundColor: ColorUtils.white,
                              activeFieldBorderColor: ColorUtils.red,
                              defaultFieldBorderColor: Color(0xffB2C2DC80),
                              fieldBorderRadius: 15.r),
                          maxLength: 6,
                          showCursor: false,
                          fieldWidth: 45,
                          fieldHeight: 45,
                          otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                          cursorColor: ColorUtils.black,
                        ),
                      ),
                      // Center(
                      //   child: OTPTextField(
                      //     //controller: otpController,
                      //     length: 6,
                      //     margin: EdgeInsets.symmetric(horizontal: 1.w),
                      //     width: 0.9.sw,

                      //     textFieldAlignment: MainAxisAlignment.spaceAround,
                      //     fieldWidth: 50,
                      //     contentPadding: EdgeInsets.symmetric(vertical: 2),
                      //     fieldStyle: FieldStyle.box,
                      //     keyboardType: TextInputType.numberWithOptions(),
                      //     otpFieldStyle: OtpFieldStyle(
                      //       backgroundColor: Colors.white,
                      //       // borderColor: AppColor.primaryButtonColor,
                      //       enabledBorderColor: Color(0xffB2C2DC80),
                      //       disabledBorderColor: Colors.green,
                      //       focusBorderColor: ColorUtils.red,
                      //     ),
                      //     outlineBorderRadius: 15.r,
                      //     style: TextStyle(
                      //       fontSize: 24.sp,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w600,
                      //     ),

                      //     onChanged: (pin) {},
                      //     onCompleted: (value) {
                      //       controller.otpPin.value = value;
                      //     },
                      //   ),
                      // ),
                      40.verticalSpace,
                      RoundButton(
                          buttonColor: ColorUtils.red,
                          height: 40,
                          width: 0.9.sw,
                          title: 'Continue',
                          onPress: () {
                            if (isProfileCreated == true) {
                              if (controller.otpPin.value.length == 6) {
                                UserServices().verifyOTPService(
                                    email: email.value,
                                    otp: controller.otpPin.value);
                              } else {
                                Get.snackbar(
                                    "Alert", "Please enter correct OTP pin",
                                    backgroundColor: ColorUtils.white);
                              }
                            } else {
                              Get.toNamed(RouteName.resetPassword);
                            }
                          }),
                      40.verticalSpace,
                      Center(
                        child: Container(
                          height: 130.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: const Offset(0, 1),
                                  color:
                                      const Color(0xff000029).withOpacity(0.20),
                                  blurRadius: 10) //blur radius of shadow
                            ],
                          ),
                          child: CircularCountDownTimer(
                            // Countdown duration in Seconds.
                            duration: controller.duration,

                            // Countdown initial elapsed Duration in Seconds.
                            initialDuration: 0,

                            // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                            controller: controller.countDownController,

                            // Width of the Countdown Widget.
                            width: 140.w,

                            // Height of the Countdown Widget.
                            height: 140.h,

                            // Ring Color for Countdown Widget.
                            ringColor: Colors.transparent,

                            // Ring Gradient for Countdown Widget.
                            ringGradient: null,

                            // Filling Color for Countdown Widget.
                            fillColor: Color(0xffFF4C00),

                            // Filling Gradient for Countdown Widget.
                            fillGradient: null,

                            // Background Color for Countdown Widget.
                            backgroundColor: ColorUtils.red,

                            // Background Gradient for Countdown Widget.
                            backgroundGradient: null,

                            // Border Thickness of the Countdown Ring.
                            strokeWidth: 5.0,

                            // Begin and end contours with a flat edge and no extension.
                            strokeCap: StrokeCap.round,

                            // Text Style for Countdown Text.
                            textStyle: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),

                            // Format for the Countdown Text.
                            textFormat: CountdownTextFormat.MM_SS,

                            // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                            isReverse: false,

                            // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                            isReverseAnimation: false,

                            // Handles visibility of the Countdown Text.
                            isTimerTextShown: true,

                            // Handles the timer start.
                            autoStart: true,

                            // This Callback will execute when the Countdown Starts.
                            onStart: () {},

                            // This Callback will execute when the Countdown Ends.
                            onComplete: () {
                              controller.complete = true;
                              controller.update();

                              // Here, do whatever you want

                              // getOtp(context);
                              debugPrint('Countdown Ended');
                            },

                            // This Callback will execute when the Countdown Changes.
                            onChange: (String timeStamp) {
                              // Here, do whatever you want
                            },
                          ),
                        ),
                      ),
                      30.verticalSpace,
                      controller.complete == true
                          ? GestureDetector(
                              onTap: () {
                                UserServices()
                                    .resendOTPService(email: email.value);
                                controller.countDownController.start();
                                controller.complete = false;

                                controller.update();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Didn’t receive code? ',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp, color: Colors.black),
                                  ),
                                  SizedBox(width: 1.w),
                                  Text(
                                    'Resend',
                                    style: GoogleFonts.inter(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
