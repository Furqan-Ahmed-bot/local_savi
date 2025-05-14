import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:local_saviors/utils/color_utils.dart';

import '../controllers/professional_controllers/p_home_controller.dart';
import '../controllers/user_controllers/home_screen_controller.dart';
import '../resources/components/sockets/chats_controller.dart';
import '../resources/components/sockets/sockets.dart';

late HomeScreenController hsController;
late PHomeController phController;
RxString role = "".obs;
bool isProfileCreated = false;
bool isHandyMan = false;
RxString email = "".obs;
late SocketController socketController;
late GetChatController chatController;

var userType;

var userId;

RxString OTP = "".obs;
// RxString pass = "".obs;b
// RxString ppas = "".obs;
// RxString pemail = "".obs;
RxString token = "".obs;
RxString refreshToken = "".obs;
var googleMapKey = 'AIzaSyC1K7IVLFLcoZlIeGBqzWVaJ5AK4g0uTf0';

final spinkit = SpinKitFadingCircle(
  color: ColorUtils.red,
  size: 50.0,
  // controller: AnimationController(
  //     vsync: this, duration: cons                                                                                            t Duration(milliseconds: 1200)),
);
