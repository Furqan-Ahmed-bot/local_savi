import 'package:get/get.dart';

class InviteUserScreenController extends GetxController {
  List listOfUserRequests = [];

  @override
  void onInit() {
    listOfUserRequests = Get.arguments['users'];
    for (int i = 0; i < listOfUserRequests.length; i++) {
      listOfUserRequests[i]['isInvited'] = false;
    }
    update();
    super.onInit();
  }

  // List listOfInviteUsers = [
  //   {
  //     "isVerified": true,
  //     "name": "Oliver Mark",
  //     "rating": "(4.5)",
  //     "isInvited": false,
  //     "image": ImageAssets.oliverImg,
  //   },
  //   {
  //     "isVerified": true,
  //     "name": "Brooklyn",
  //     "rating": "(4.5)",
  //     "isInvited": false,
  //     "image": ImageAssets.johnImg,
  //   },
  //   {
  //     "isVerified": false,
  //     "name": "Esther Wade",
  //     "rating": "(4.5)",
  //     "isInvited": false,
  //     "image": ImageAssets.oliverImg,
  //   },
  //   {
  //     "isVerified": true,
  //     "name": "Marvin",
  //     "rating": "(4.5)",
  //     "isInvited": false,
  //     "image": ImageAssets.johnImg,
  //   },
  //   {
  //     "isVerified": false,
  //     "name": "Kristin",
  //     "isInvited": false,
  //     "rating": "(4.5)",
  //     "image": ImageAssets.oliverImg,
  //   },
  //   {
  //     "isVerified": false,
  //     "name": "James Adam",
  //     "rating": "(4.5)",
  //     "isInvited": false,
  //     "image": ImageAssets.johnImg,
  //   },
  //   {
  //     "isVerified": true,
  //     "name": "Annette",
  //     "rating": "(4.5)",
  //     "isInvited": false,
  //     "image": ImageAssets.oliverImg,
  //   },
  // ];
}
