import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/home_screen_controller.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class BestPerformerScreenController extends GetxController {
  @override
  void onInit() {
    Future.microtask(() {
      hsController.getBestPerformers();
    });
    super.onInit();
  }

  List listOfBestPerformers = [
    {
      "isVerified": true,
      "name": "Oliver Mark",
      "rating": "(4.5)",
      "image": ImageAssets.oliverImg,
    },
    {
      "isVerified": true,
      "name": "Brooklyn",
      "rating": "(4.5)",
      "image": ImageAssets.johnImg,
    },
    {
      "isVerified": false,
      "name": "Esther Wade",
      "rating": "(4.5)",
      "image": ImageAssets.oliverImg,
    },
    {
      "isVerified": true,
      "name": "Marvin",
      "rating": "(4.5)",
      "image": ImageAssets.johnImg,
    },
    {
      "isVerified": false,
      "name": "Kristin",
      "rating": "(4.5)",
      "image": ImageAssets.oliverImg,
    },
    {
      "isVerified": false,
      "name": "James Adam",
      "rating": "(4.5)",
      "image": ImageAssets.johnImg,
    },
    {
      "isVerified": true,
      "name": "Annette",
      "rating": "(4.5)",
      "image": ImageAssets.oliverImg,
    },
  ];
}
