import 'package:get/get.dart';

class PFilterController extends GetxController {
  RxBool isAm = false.obs;
  RxDouble startDistance = 20.0.obs;
  RxDouble endDistance = 50.0.obs;
  RxDouble startPrice = 150.0.obs;
  RxDouble endPrice = 200.0.obs;
}
