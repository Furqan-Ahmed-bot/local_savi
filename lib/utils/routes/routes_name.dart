// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:local_saviors/screens/professional_screens/p_cancel_job_reason_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_filter_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_help_and_feedback_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_home_screen.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_one.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_two.dart';
import 'package:local_saviors/screens/professional_screens/p_job_detail_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_job_provider_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_jobs_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_message_dashboard_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_my_profile_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_notification_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_rating_and_reviews_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_saved_jobs_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_search_result_screen.dart';
import 'package:local_saviors/screens/settings_screens/about_screen.dart';
import 'package:local_saviors/screens/settings_screens/change_pass_screen.dart';
import 'package:local_saviors/screens/settings_screens/privacy_policy_screen.dart';
import 'package:local_saviors/screens/settings_screens/setting_screen.dart';
import 'package:local_saviors/screens/settings_screens/terms_condition_screen.dart';
import 'package:local_saviors/screens/user_screens/best_performer_detail_screen.dart';
import 'package:local_saviors/screens/user_screens/best_performer_screen.dart';
import 'package:local_saviors/screens/user_screens/canceled_job_screen.dart';
import 'package:local_saviors/screens/user_screens/chat_screen.dart';
import 'package:local_saviors/screens/user_screens/create_job_post_screen.dart';
import 'package:local_saviors/screens/user_screens/dispute_payment_screen.dart';
import 'package:local_saviors/screens/user_screens/home_screen.dart';
import 'package:local_saviors/screens/user_screens/invite_user_screen.dart';
import 'package:local_saviors/screens/user_screens/job_cancel_screen.dart';
import 'package:local_saviors/screens/user_screens/job_completed_screen.dart';
import 'package:local_saviors/screens/user_screens/jobs_screen.dart';
import 'package:local_saviors/screens/user_screens/message_dashboard_screen.dart';
import 'package:local_saviors/screens/user_screens/notification_screen.dart';
import 'package:local_saviors/screens/user_screens/ongoing_job_detail_screen.dart';
import 'package:local_saviors/screens/user_screens/posted_job_screen.dart';
import 'package:local_saviors/screens/user_screens/rate_employee_screen.dart';
import 'package:local_saviors/screens/user_screens/rating_and_review_screen.dart';
import 'package:local_saviors/screens/user_screens/reschedule_card_screen.dart';
import 'package:local_saviors/screens/user_screens/reschedule_screen.dart';
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
          name: RouteName.jobCancelScreenPath,
          page: () => JobCancelScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.rescheduleJobScreenPath,
          page: () => RescheduleScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.rescheduleCardsScreenPath,
          page: () => RescheduleCardScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.createJobPostScreenPath,
          page: () => CreateJobPostScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.cancelledJobScreenPath,
          page: () => CancelledJobScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.rateEmployeeScreenPath,
          page: () => RateEmployeeScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.disputePaymentScreenPath,
          page: () => DisputePaymentScreen(),
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
        // GetPage(
        //   name: RouteName.bottomNavBarScreenPath,
        //   page: () => NavbarScreen(),
        //   binding: ScreenBindings(),
        // ),
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
          name: RouteName.chatScreenPath,
          page: () => ChatScreen(),
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

/////professionals
        ///
        ///
        GetPage(
          name: RouteName.pHomeScreenPath,
          page: () => PHomeScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pMessageDashboardScreenPath,
          page: () => PMessageDashboardScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pSavedJobsScreenPath,
          page: () => PSavedJobsScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pJobsScreenPath,
          page: () => PJobsScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pJobsDetailScreenPath,
          page: () => PJobDetailScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pCanceJobReasonScreenPath,
          page: () => PCancelJobReasonScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pJobProviderScreenPath,
          page: () => PJobProviderScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pNotificaitonScreenPath,
          page: () => PNotificationScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pMyProfileScreenPath,
          page: () => PMyProfileScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pRatingReviewsScreenPath,
          page: () => PRatingAndReviewsScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.pHelpFeedbackScreenPath,
          page: () => PHelpAndFeedbackScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.psearchFilterScreenPath,
          page: () => PFilterScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.psearchResultScreenPath,
          page: () => PSearchResultScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.settingScreenPath,
          page: () => SettingScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.aboutScreenPath,
          page: () => AboutScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.termsAndConditionScreenPath,
          page: () => TermsConditionScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.privacyPolicyScreenPath,
          page: () => PrivacyPolicyScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.changePassScreenPath,
          page: () => ChangePassScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
      ];
}
