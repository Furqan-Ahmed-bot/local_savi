import 'dart:async';

import 'package:get/get.dart';

import '../../utils/routes/routes.dart';

class SplashServices {
  void isLogin() {
    Timer(
        const Duration(seconds: 3), () => Get.toNamed(RouteName.selectRoleOne));
  }
}
