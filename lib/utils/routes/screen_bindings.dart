import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_cancel_job_reason_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_chat_screen_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_filter_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_help_and_feedback_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_home_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_job_detail_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_job_provider_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_jobs_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_message_dashboard_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_my_profile_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_notification_coontroller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_rating_and_reviews_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_saved_jobs_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/p_search_result_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/payment_history_controller.dart';
import 'package:local_saviors/controllers/professional_controllers/payment_method_controller.dart';
import 'package:local_saviors/controllers/setting_controllers/about_controller.dart';
import 'package:local_saviors/controllers/setting_controllers/change_pass_controller.dart';
import 'package:local_saviors/controllers/setting_controllers/privacy_policy_controller.dart';
import 'package:local_saviors/controllers/setting_controllers/setting_controller.dart';
import 'package:local_saviors/controllers/setting_controllers/terms_condition_controller.dart';
import 'package:local_saviors/controllers/user_controllers/best_performer_detail_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/best_performer_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/bottom_nav_bar_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/cancelled_job_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/chat_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/create_job_post_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/dispute_payment_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/home_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/invite_user_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/job_cancel_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/job_completed_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/jobs_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/message_dashboard_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/notification_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/ongoing_job_detail_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/posted_job_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/rate_employee_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/rating_and_review_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/reschedule_card_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/reschedule_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/upcoming_job_detail_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/user_profile_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/user_request_screen_controller.dart';
import 'package:local_saviors/screens/professional_screens/p_payment_method_screen.dart';

import '../../controllers/professional_controllers/add_bank_controller.dart';
import '../../controllers/professional_controllers/wallet_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => JobsScreenController());
    Get.lazyPut(() => NotificationScreenController());
    Get.lazyPut(() => BestPerformerScreenController());
    Get.lazyPut(() => UserRequestScreenController());
    Get.lazyPut(() => BestPerformerDetailScreenController());
    Get.lazyPut(() => RatingAndReviewScreenController());
    Get.lazyPut(() => UserProfileScreenController());
    Get.lazyPut(() => PostedJobScreenController());
    Get.lazyPut(() => InviteUserScreenController());
    Get.lazyPut(() => MessageDashboardScreenController());
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => UpcomingJobDetailScreenController());
    Get.lazyPut(() => OngoingJobDetailScreenController());
    Get.lazyPut(() => JobCompletedScreenController());
    Get.lazyPut(() => CancelledJobScreenController());
    Get.lazyPut(() => RateEmployeeScreenController());
    Get.lazyPut(() => DisputePaymentScreenController());
    Get.lazyPut(() => ChatScreenController());
    Get.lazyPut(() => JobCancelScreenController());
    Get.lazyPut(() => RescheduleScreenController());
    Get.lazyPut(() => RescheduleCardScreenController());
    Get.lazyPut(() => CreateJobPostScreenController());

    ///professional
    Get.lazyPut(() => PHomeController());
    Get.lazyPut(() => PMessageDashboardController());
    Get.lazyPut(() => PSavedJobsController());
    Get.lazyPut(() => PJobsController());
    Get.lazyPut(() => PJobDetailController());
    Get.lazyPut(() => PCancelJobReasonController());
    Get.lazyPut(() => PJobProvidercontroller());
    Get.lazyPut(() => PNotificationCoontroller());
    Get.lazyPut(() => PMyProfileController());
    Get.lazyPut(() => PHelpAndFeedbackController());
    Get.lazyPut(() => PRatingAndReviewsScreenController());
    Get.lazyPut(() => PFilterController());
    Get.lazyPut(() => PChatScreenController());
    Get.lazyPut(() => PSearchResultController());

    //settings
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => AboutController());
    Get.lazyPut(() => PrivacyPolicyController());
    Get.lazyPut(() => TermsConditionController());
    Get.lazyPut(() => ChangePassController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => AddBankController());
    Get.lazyPut(() => PaymentHistoryController());
    Get.lazyPut(() => PaymentMethodController());
  }
}
