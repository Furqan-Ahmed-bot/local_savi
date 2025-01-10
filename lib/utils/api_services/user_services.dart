// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:local_saviors/controllers/user_controllers/home_screen_controller.dart';
import 'package:local_saviors/resources/components/bottom_navbar.dart';
import 'package:local_saviors/resources/components/p_bottom_nav_bar.dart';
import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';

import '../../models/job_provider_model/job_provider_model.dart';
import '../routes/route_arguments.dart';

class UserServices {
  final homeController = Get.put(HomeScreenController());
  loginService({required String email, required String password, required context}) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization':
        //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.loginUrl));
      request.body = json.encode({"identifier": email, "password": password, "fcm_token": "test"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        token.value = responseData['data']['access_token'];
        refreshToken.value = responseData['data']['refresh_token'];
        Get.close(1);
        if (responseData['data']['is_profile_completed']) {
          await getProfileService(context: context).then((value) {
            role.value == "user" ? Get.to(() => NavbarScreen()) : Get.to(PBottomNavBar());
          });
        } else {
          Get.snackbar("Alert", "Please create your profile", backgroundColor: ColorUtils.white);
          Get.toNamed(RouteName.createProfile);
        }
      } else {
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
        print(response.reasonPhrase);
      }
    } catch (e) {
      Get.close(1);

      debugPrint("==> error: ${e.toString()}");
    }
  }

  signupService({
    required String emailAddress,
    required String password,
    required String type,
    required context,
  }) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization':
        //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.signupUrl));
      request.body = json.encode({
        "identifier": emailAddress,
        "user_type": type,
        "password": password,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        email.value = emailAddress;
        OTP = responseData['data']['otp'];
        // pass.value = password;
        Get.close(1);
        Get.snackbar("OTP CODE", responseData['data']['otp'].toString(), backgroundColor: ColorUtils.white);
        Get.toNamed(
            arguments: MyArguments(
              data: false,
            ),
            RouteName.otpverification);
      } else {
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }

  verifyOTPService({required String otp, required context, required bool isProfileCompleetd, isForgetPassword = false}) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization':
        //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.verifyOTPUrl));
      request.body = json.encode({
        // "password": pass.value,
        "identifier": email.value,

        "otp": otp
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        Get.close(1);
        token.value = responseData['data']['access_token'];
        refreshToken.value = responseData['data']['refresh_token'];
        Get.toNamed(RouteName.createProfile);
        if (isForgetPassword == true) {
          Get.toNamed(RouteName.resetPassword);
        } else {
          Get.toNamed(RouteName.createProfile);
        }
      } else {
        Get.close(1);
        debugPrint(await response.stream.bytesToString());
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }

  resendOTPService({
    required String email,
    required context,
  }) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization':
        //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.resendOTPUrl));
      request.body = json.encode({"identifier": email});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        Get.close(1);
        Get.snackbar("Success", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      } else {
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }

  forgetPasswordService({
    required String email,
    required context,
  }) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization':
        //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYmE2OGY5LWYzMzQtNDVkNy05YmY2LTk1NzgyZDcxMzNlMCIsInR5cGUiOiJVU0VSIiwiaWF0IjoxNzMxNzM3MTQyLCJleHAiOjE3MzE4MjM1NDJ9.Ya5vgz1bSOAhseIU5AyoS65RrMOM26fcKof_wiIRDaw'
      };
      var request = http.Request('POST', Uri.parse(UserUrls.forgetPasswordUrl));
      request.body = json.encode({"identifier": email});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        OTP = responseData['data']['otp'];
        Get.close(1);
        Get.toNamed(
            arguments: MyArguments(
              data: true,
            ),
            RouteName.otpverification);
      } else {
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }

  resetPasswordService({
    required String password,
    required context,
  }) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {'Content-Type': 'application/json', 'Authorization': token.value};
      var request = http.Request('POST', Uri.parse(UserUrls.resetPasswordUrl));
      request.body = json.encode({"password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
        Get.offAllNamed(RouteName.login);
      } else {
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
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
      required context,
      required String city,
      required String about,
      required String image}) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {'Authorization': token.value};

      var request = http.MultipartRequest('POST', Uri.parse(UserUrls.createProfileUrl));
      request.fields.addAll({
        'address': address,
        // 'gender': gender,
        'date_of_birth': "2004-03-04T17:22:09.895Z",
        //dob,
        // 'phone': phone,
        'contact_email': email,
        'first_name': firstName,
        'last_name': lastName,
        // 'country': country,
        // 'state': state,
        // 'city': city,
        "location": "USA",
        'description': about,
        'longitude': '67',
        'latitude': '24'
      });
      request.files.add(await http.MultipartFile.fromPath('profile_picture', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        Get.close(1);
        await getProfileService(context: context).then((value) {
          role.value == "user" ? Get.to(() => NavbarScreen()) : Get.toNamed(RouteName.cretaetProfileTwoPath);
        });
      } else {
        log(response.toString());
        Get.close(1);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }

  Future getProfileService({required context}) async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getProfileUrl));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        homeController.setUserData(JobProviderModel.fromJson(jsonResponse['data']));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
    }
  }

  logoutService({
    required context,
  }) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {'Content-Type': 'application/json', 'Authorization': token.value};
      var request = http.Request('POST', Uri.parse(UserUrls.logoutUrl));
      request.body = json.encode({"refresh_token": refreshToken.value});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(responseData);
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
        Get.offAllNamed(RouteName.selectRoleOne);
      } else {
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }
}
