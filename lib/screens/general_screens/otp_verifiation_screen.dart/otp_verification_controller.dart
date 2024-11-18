import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpVerificationController extends GetxController {
  final int duration = 60;
  RxString otpPin = "".obs;

  final otpPinFieldController = GlobalKey<OtpPinFieldState>();
  final CountDownController countDownController = CountDownController();

  bool complete = false;
}
