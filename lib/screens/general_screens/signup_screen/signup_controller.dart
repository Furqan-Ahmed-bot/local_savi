import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/validations.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isValidate = false.obs;

  validateSignupCred() {
    isValidate.value = true;
    if (validateInputs(formKey: formKey)) {
      FocusScope.of(Get.context!).unfocus();
      isProfileCreated = true;

      UserServices.instance.signupService(
          type: role.value == "PROFESSIONAL" || role.value == "HANDYMAN"
              ? "PERFORMER"
              : "USER",
          context: Get.context!,
          emailAddress: emailController.text,
          password: passwordController.text);
    }
  }
}
