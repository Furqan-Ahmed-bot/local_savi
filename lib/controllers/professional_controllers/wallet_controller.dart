import 'package:get/get.dart';

class WalletController extends GetxController {
  RxInt currentIndex = 0.obs;

  updateIndex(index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    print('wallet controller ');
    super.onInit();
  }
}
