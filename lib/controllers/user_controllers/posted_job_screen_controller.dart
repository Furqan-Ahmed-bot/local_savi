import 'package:get/get.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class PostedJobScreenController extends GetxController {
  RxBool isViewDetail = false.obs;
  List dummyData = [
    {
      "title": "Work Type",
      "value": "Professional",
    },
    {
      "title": "Job Budget",
      "value": "\$ 50.00 / hr",
    },
    {
      "title": "Job Time",
      "value": "03:00 pm",
    },
    {
      "title": "Job Date",
      "value": "May 18, 2024",
    },
    {
      "title": "Job Address",
      "value": "204 N Auburn Ave, Farmington, New York, 87401",
    },
  ];

  List listOfBestPerformers = [
    {
      "isVerified": true,
      "name": "Oliver Mark",
      "rating": "(4.5)",
      "image": ImageAssets.oliverImg,
    },
    {
      "isVerified": true,
      "name": "William Roy",
      "rating": "(4.5)",
      "image": ImageAssets.johnImg,
    },
    {
      "isVerified": true,
      "name": "Brooklyn",
      "rating": "(4.5)",
      "image": ImageAssets.oliverImg,
    },
  ];
}
