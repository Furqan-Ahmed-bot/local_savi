import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/best_performer_detail_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/best_performer_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/bottom_nav_bar_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/cancelled_job_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/dispute_payment_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/home_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/invite_user_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/job_completed_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/jobs_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/message_dashboard_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/notification_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/ongoing_job_detail_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/posted_job_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/rate_employee_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/rating_and_review_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/upcoming_job_detail_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/user_profile_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/user_request_screen_controller.dart';

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
  }
}
