import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:local_saviors/utils/color_utils.dart';

RxString role = "".obs;
bool isProfileCreated = false;
RxString email = "".obs;
var OTP;
// RxString pass = "".obs;
// RxString ppas = "".obs;
// RxString pemail = "".obs;
RxString token = "".obs;
RxString refreshToken = "".obs;

final spinkit = SpinKitFadingCircle(
  color: ColorUtils.red,
  size: 50.0,
  // controller: AnimationController(
  //     vsync: this, duration: const Duration(milliseconds: 1200)),
);
