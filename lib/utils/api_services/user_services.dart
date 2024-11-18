import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:local_saviors/resources/components/bottom_navbar.dart';
import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';

class UserServices {
  loginService({
    required String email,
    required String password,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.loginUrl));
      request.body = json.encode({"identifier": email, "password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        token.value = responseData['data']['access_token'];
        Get.to(() => NavbarScreen());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  signupService({
    required String emailAddress,
    required String password,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.signupUrl));
      request.body = json.encode({
        "identifier": emailAddress,
        "user_type": "USER",
        "password": password
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        email.value = emailAddress;
        Get.snackbar("OTP CODE", responseData['data']['otp'].toString(),
            backgroundColor: ColorUtils.white);
        Get.toNamed(RouteName.otpverification);
      } else {
        Get.snackbar("Alert", responseData['message'].toString(),
            backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  verifyOTPService({
    required String email,
    required String otp,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.verifyOTPUrl));
      request.body = json.encode({"identifier": email, "otp": otp});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        token.value = responseData['data']['access_token'];
        Get.toNamed(RouteName.createProfile);
      } else {
        debugPrint(await response.stream.bytesToString());
        Get.snackbar("Alert", responseData['message'].toString(),
            backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  resendOTPService({
    required String email,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.resendOTPUrl));
      request.body = json.encode({"identifier": email});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
      } else {
        Get.snackbar("Alert", responseData['message'].toString(),
            backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  forgetPasswordService({
    required String email,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.forgetPasswordUrl));
      request.body = json.encode({"identifier": email});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        Get.toNamed(RouteName.otpverification);
      } else {
        Get.snackbar("Alert", responseData['message'].toString(),
            backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  resetPasswordService({
    required String password,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.resetPasswordUrl));
      request.body = json.encode({"password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        Get.offAllNamed(RouteName.login);
      } else {
        Get.snackbar("Alert", responseData['message'].toString(),
            backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  createProfileService(
      {required String address,
      required String gender,
      required String dob,
      required String phone,
      required String email,
      required String firstName,
      required String lastName,
      required String country,
      required String state,
      required String city,
      required String about,
      required String image}) async {
    try {
      var headers = {'Authorization': token.value};
      var request =
          http.MultipartRequest('POST', Uri.parse(UserUrls.createProfileUrl));
      request.fields.addAll({
        'address': address,
        'gender': gender,
        'date_of_birth': dob,
        'contact_phone': phone,
        'contact_email': email,
        'first_name': firstName,
        'last_name': lastName,
        'country': country,
        'state': state,
        'city': city,
        'description': about,
        'longitude': '67',
        'latitude': '24'
      });
      request.files
          .add(await http.MultipartFile.fromPath('profile_picture', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        Get.to(() => NavbarScreen());
      } else {
        Get.snackbar("Alert", responseData['message'].toString(),
            backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  getProfileService() async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getProfileUrl));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }
}
