import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/validations.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  final formKey = GlobalKey<FormState>();
  RxBool isValidate = false.obs;

  validateSigninCred() {
    isValidate.value = true;
    if (validateInputs(formKey: formKey)) {
      FocusScope.of(Get.context!).unfocus();

      UserServices.instance.loginService(
        context: Get.context!,
        userEmail: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
