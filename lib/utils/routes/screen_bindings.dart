import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/home_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/jobs_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/notification_screen_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => JobsScreenController());
    Get.lazyPut(() => NotificationScreenController());
  }
}
