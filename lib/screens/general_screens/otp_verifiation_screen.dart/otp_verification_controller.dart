import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  final int duration = 60;

  final CountDownController countDownController = CountDownController();

  bool complete = false;
}
