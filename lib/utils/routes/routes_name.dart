// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import 'package:local_saviors/resources/components/bottom_navbar.dart';
import 'package:local_saviors/resources/components/p_bottom_nav_bar.dart';

import 'package:local_saviors/screens/general_screens/create_profile_screen/create_profile_screen.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/create_profile_two_screen.dart';
import 'package:local_saviors/screens/general_screens/forget_password_screen/forget_password.dart';
import 'package:local_saviors/screens/general_screens/login_screen/login_screen.dart';
import 'package:local_saviors/screens/general_screens/otp_verifiation_screen.dart/otp_verification.dart';
import 'package:local_saviors/screens/general_screens/pre_login_screen/pre_login_screen.dart';
import 'package:local_saviors/screens/general_screens/reset_password_screen.dart/reset_password_screen.dart';
import 'package:local_saviors/screens/general_screens/signup_screen/signup_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_addfunds_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_cancel_job_reason_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_chat_screen.dart';
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
import 'package:local_saviors/screens/professional_screens/p_payment_method_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_rating_and_reviews_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_saved_jobs_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_search_result_screen.dart';
import 'package:local_saviors/screens/professional_screens/wallet_screen.dart';
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
import 'package:local_saviors/screens/user_screens/edit_job_screen.dart';
import 'package:local_saviors/screens/user_screens/edit_profile_screen.dart';
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

import '../../screens/professional_screens/p_payment_history.dart';
import '../../screens/professional_screens/p_select_bank_screen.dart';
import '../../screens/professional_screens/p_wallet_screen.dart';
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
          name: RouteName.pchatScreenPath,
          page: () => PChatScreen(),
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
        GetPage(
          name: RouteName.bottomNavBarScreenPath,
          page: () => NavbarScreen(),
          binding: ScreenBindings(),
        ),
        GetPage(
          name: RouteName.pBottomNavBarScreenPath,
          page: () => PBottomNavBar(),
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
          name: RouteName.editJobScreenPath,
          page: () => EditJobScreen(),
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
          name: RouteName.editProfileScreenPath,
          page: () => EditProfileScreen(),
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
          name: RouteName.cretaetProfileTwoPath,
          page: () => CreateProfileTwoScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
            name: RouteName.selectRoleOne,
            page: () => SelectUserRoleOne(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),
        GetPage(
            name: RouteName.selectRoleTwo,
            page: () => SelectUserRoleTwo(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),
        GetPage(
            name: RouteName.otpverification,
            page: () => OtpVerificationScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()
            // transition: Transition.leftToRightWithFade,
            ),
        GetPage(
            name: RouteName.signup,
            page: () => SignupScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()

            // transition: Transition.leftToRightWithFade,
            ),
        GetPage(
            name: RouteName.resetPassword,
            page: () => ResetPasswordScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),
        GetPage(
            name: RouteName.prelogin,
            page: () => PreLoginScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),
        GetPage(
            name: RouteName.addFundsScreenPath,
            page: () => AddFundsScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),
        GetPage(
            name: RouteName.login,
            page: () => LoginScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),
        GetPage(
            name: RouteName.forgetPassword,
            page: () => ForgetPasswordScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),
        GetPage(
            name: RouteName.createProfile,
            page: () => CreateProfileScreen(),
            transitionDuration: Duration(milliseconds: 250),
            binding: ScreenBindings()),

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
        GetPage(
          name: RouteName.walletScreen,
          page: () => WalletScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.addBankScreen,
          page: () => SelectBankScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.providerWalletScreen,
          page: () => ProviderWalletScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.paymentHistoryScreen,
          page: () => ProviderPaymentHistoryScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),

        GetPage(
          name: RouteName.paymentMethodScreen,
          page: () => PaymentMethodScreen(),
          binding: ScreenBindings(),
          transitionDuration: Duration(milliseconds: 250),
        ),
      ];
}
