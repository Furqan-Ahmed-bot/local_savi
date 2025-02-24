import 'dart:convert';

import 'package:get/get.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import "package:http/http.dart" as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/constant.dart';

class RatingAndReviewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  List allReviews = [];
  Map userRatings = {};
  var userId;

  @override
  void onInit() {
    userId = Get.arguments['user_id'];
    getAllReviews();
    // TODO: implement onInit
    super.onInit();
  }

  List dummyData = [
    {
      "image": ImageAssets.william3,
      "name": "William Roy",
      "dateTime": "Today | 02:35 pm",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.",
      "isReply": true,
    },
    {
      "image": ImageAssets.william1,
      "name": "William Roy",
      "dateTime": "Today | 02:35 pm",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.",
      "isReply": false,
    },
    {
      "image": ImageAssets.william2,
      "name": "William Roy",
      "dateTime": "Today | 02:35 pm",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.",
      "isReply": false,
    },
    {
      "image": ImageAssets.william4,
      "name": "William Roy",
      "dateTime": "Today | 02:35 pm",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.",
      "isReply": false,
    },
  ];

  getAllReviews() async {
    try {
      var headers = {'Authorization': token.value};

      isLoading.value = true;
      final uri = Uri.parse("${UserUrls.giveReview}/$userId");

      http.Response response = await http.get(uri, headers: headers);
      var resData = json.decode(response.body.toString());
      if (resData['status']['success'] == true) {
        isLoading.value = false;
        userRatings = resData['data']['user_rating'];
        allReviews = resData['data']['user_reviews'];
      } else {
        resData['status'];

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }
}
