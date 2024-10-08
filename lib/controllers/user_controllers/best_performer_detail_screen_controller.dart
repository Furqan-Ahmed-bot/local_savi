import 'package:get/get.dart';

class BestPerformerDetailScreenController extends GetxController {
  RxString title = "".obs;
  RxBool showChat = true.obs;

  List dummyData = [
    {
      "title": "Completed Jobs",
      "value": "54",
    },
    {
      "title": "Work Type",
      "value": "Professional",
    },
    {
      "title": "Skills",
      "value": "Interior Designer",
    },
    {
      "title": "Age",
      "value": "22 years old",
    },
    {
      "title": "Gender",
      "value": "Male",
    },
    {
      "title": "Address",
      "value": "204 N Auburn Ave, Farmington, New York, 87401",
    },
    {
      "title": "Country",
      "value": "United States",
    },
    {
      "title": "Email",
      "value": "Oliver.mark@domain.com",
    },
    {
      "title": "Phone Number",
      "value": "+1 234 567890",
    },
    {
      "title": "About",
      "value":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
    },
  ];

  @override
  void onInit() {
    title.value = Get.arguments['title'] ?? "User Detail";
    showChat.value = Get.arguments['showChat'] ?? true;
    super.onInit();
  }
}
