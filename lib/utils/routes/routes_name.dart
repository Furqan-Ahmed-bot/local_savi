// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_one.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_two.dart';

import '../../screens/splash/splash_view.dart';
import 'routes.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.selectRoleOne,
          page: () => SelectUserRoleOne(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.selectRoleTwo,
          page: () => SelectUserRoleTwo(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        // GetPage(
        //   name: RouteName.otpverification,
        //   page: () => OtpVerificationScreen(),
        //   transitionDuration: Duration(milliseconds: 250),
        //   // transition: Transition.leftToRightWithFade,
        // ),
        // GetPage(
        //   name: RouteName.tablecalender,
        //   page: () => tablecalendar(),
        //   transitionDuration: Duration(milliseconds: 250),
        //   // transition: Transition.leftToRightWithFade,
        // ),
        // GetPage(
        //   name: RouteName.mainScreen,
        //   page: () => MainScreen(),
        //   transitionDuration: Duration(milliseconds: 250),
        //   // transition: Transition.leftToRightWithFade,
        // ),
      ];
}
