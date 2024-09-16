import 'package:get/get.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class PMessageDashboardController extends GetxController {
  List listOfMessageUsers = [
    {
      "isVerified": true,
      "name": "Oliver Mark",
      "date": "Today",
      "desc":
          "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis",
      "image": ImageAssets.oliverImg,
    },
    {
      "isVerified": true,
      "name": "Brooklyn",
      "date": "Yesterday",
      "desc":
          "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis",
      "image": ImageAssets.johnImg,
    },
    {
      "isVerified": false,
      "name": "Esther Wade",
      "date": "Jun 20",
      "desc":
          "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis",
      "image": ImageAssets.oliverImg,
    },
    {
      "isVerified": true,
      "name": "Marvin",
      "date": "Jun 13",
      "desc":
          "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis",
      "image": ImageAssets.johnImg,
    },
    {
      "isVerified": false,
      "name": "Kristin",
      "date": "Jun 13",
      "desc":
          "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis",
      "image": ImageAssets.oliverImg,
    },
    {
      "isVerified": false,
      "name": "James Adam",
      "date": "Jun 05",
      "desc":
          "Lorem ipsum dolor sit amet consectetur adipisng elit odio, mattis",
      "image": ImageAssets.johnImg,
    },
  ];
}
