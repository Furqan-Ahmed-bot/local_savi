import 'package:get/get.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class AddBankController extends GetxController {
  List banks = [
    {
      'name': 'Bank Of America',
      'routing no': '0230 3030 2365',
      'image': ImageAssets.bank1,
      'isSelected': true
    },
    {
      'name': 'Wells Frago',
      'routing no': '0230 3030 2365',
      'image': ImageAssets.bank2,
      'isSelected': false
    },
    {
      'name': 'Chase Bank',
      'routing no': '0230 3030 2365',
      'image': ImageAssets.bank3,
      'isSelected': false
    }
  ];
}
