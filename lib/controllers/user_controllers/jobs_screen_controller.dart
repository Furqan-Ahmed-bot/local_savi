import 'package:get/get.dart';

class JobsScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<String> names = [
    "Open",
    "Upcoming",
    "Ongoing",
    "Completed",
    "Cancelled"
  ];
}
