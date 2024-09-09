// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_one.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_two.dart';
import 'package:local_saviors/screens/user_screens/home_screen.dart';
import 'package:local_saviors/screens/user_screens/jobs_screen.dart';
import 'package:local_saviors/screens/user_screens/notification_screen.dart';
import 'package:local_saviors/utils/routes/screen_bindings.dart';

import '../../screens/splash/splash_view.dart';
import 'routes.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.homeScreenPath,
          page: () => HomeScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.notificationsScreenPath,
          page: () => NotificationScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.jobsScreenPath,
          page: () => JobsScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
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
