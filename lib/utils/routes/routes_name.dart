// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_one.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_two.dart';
import 'package:local_saviors/screens/user_screens/best_performer_detail_screen.dart';
import 'package:local_saviors/screens/user_screens/best_performer_screen.dart';
import 'package:local_saviors/screens/user_screens/home_screen.dart';
import 'package:local_saviors/screens/user_screens/invite_user_screen.dart';
import 'package:local_saviors/screens/user_screens/job_completed_screen.dart';
import 'package:local_saviors/screens/user_screens/jobs_screen.dart';
import 'package:local_saviors/screens/user_screens/message_dashboard_screen.dart';
import 'package:local_saviors/screens/user_screens/notification_screen.dart';
import 'package:local_saviors/screens/user_screens/ongoing_job_detail_screen.dart';
import 'package:local_saviors/screens/user_screens/posted_job_screen.dart';
import 'package:local_saviors/screens/user_screens/rating_and_review_screen.dart';
import 'package:local_saviors/screens/user_screens/upcoming_job_detail_screen.dart';
import 'package:local_saviors/screens/user_screens/user_profile_screen.dart';
import 'package:local_saviors/screens/user_screens/user_request_screen.dart';
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
          name: RouteName.upcomingJobDetailScreenPath,
          page: () => UpcomingJobDetailScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.ongoingJobDetailScreenPath,
          page: () => OngoingJobDetailScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.jobCompletedScreenPath,
          page: () => JobCompletedScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.userprofileScreenPath,
          page: () => UserProfileScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.bottomNavBarScreenPath,
          page: () => BottomAppBar(),
          binding: ScreenBindings(),
        ),
        GetPage(
          name: RouteName.messagesScreenPath,
          page: () => MessageDashboardScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.inviteUserScreenPath,
          page: () => InviteUserScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.jobPostedScreenPath,
          page: () => PostedJobScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.ratingAndReviewsScreenPath,
          page: () => RatingAndReviewScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.bestPerformerDetailScreenPath,
          page: () => BestPerformerDetailScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.userRequestScreenPath,
          page: () => UserRequestScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.bestPerformerScreenPath,
          page: () => BestPerformerScreen(),
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
