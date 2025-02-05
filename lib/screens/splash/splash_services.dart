import 'dart:async';

import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/constant.dart';

import '../../resources/ prefrences/auth_prefrences.dart';
import '../../utils/routes/routes.dart';

class SplashServices {
  final userServices = UserServices.instance;
  void isLogin() async {
    String? authToken = await AuthPreferences.getAuthToken() ?? '';
    String? _userRole = await AuthPreferences.getUserRole() ?? '';
    String? _refreshToken = await AuthPreferences.getRefreshToken() ?? '';
    token.value = authToken;
    role.value = _userRole;
    refreshToken.value = _refreshToken;

    Timer(const Duration(seconds: 3), () {
      if (token.value.isNotEmpty && authToken.isNotEmpty) {
        if (_userRole == 'USER') {
          userServices.getProfileService(isAutoLogin: true);
        } else {
          userServices.getProfileService(isAutoLogin: true);
        }
      } else {
        Get.toNamed(RouteName.selectRoleOne);
      }
    });
  }
}
