import 'package:get/get.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class SettingController extends GetxController {
  RxBool pushNotification = false.obs;
  List listofSettings = [
    {
      "title": "Change Passowrd",
      "image": ImageAssets.settingChangePass,
      "route": RouteName.changePassScreenPath
    },
    {
      "title": "Terms & Conditions",
      "image": ImageAssets.settingTerms,
      "route": RouteName.termsAndConditionScreenPath
    },
    {
      "title": "Privacy Policy",
      "image": ImageAssets.settingPrivacy,
      "route": RouteName.privacyPolicyScreenPath
    },
    {
      "title": "About App",
      "image": ImageAssets.settingAbout,
      "route": RouteName.aboutScreenPath
    },
  ];
}
