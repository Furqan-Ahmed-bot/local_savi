// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:local_saviors/controllers/user_controllers/home_screen_controller.dart';
import 'package:local_saviors/controllers/user_controllers/user_profile_screen_controller.dart';
import 'package:local_saviors/models/bookmark_model.dart';
import 'package:local_saviors/models/job_performer_model/job_performer_model.dart';
import 'package:local_saviors/models/job_performer_model/performer_all_jobs_model.dart';
import 'package:local_saviors/models/job_provider_model/JobsModel.dart';
import 'package:local_saviors/models/performer_model/performer_model.dart';
import 'package:local_saviors/resources/components/bottom_navbar.dart';
import 'package:local_saviors/resources/components/p_bottom_nav_bar.dart';

import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import '../../controllers/professional_controllers/p_home_controller.dart';
import '../../controllers/user_controllers/posted_job_screen_controller.dart';
import '../../models/job_provider_model/job_provider_model.dart';
import '../../resources/ prefrences/auth_prefrences.dart';
import '../../screens/general_screens/create_profile_screen/create_profile__two_controller.dart';
import '../routes/route_arguments.dart';

class UserServices {
  UserServices._privateConstructor();

  static final UserServices _instance = UserServices._privateConstructor();

  static UserServices get instance => _instance;

  // final homeController = Get.put(HomeScreenController());
  // final userProfile = Get.put(UserProfileScreenController());
  // final performerController = Get.put(PHomeController());
  final createProfileController = Get.put(CreatePorfileTwoController());
  loginService({required String userEmail, required String password, required context}) async {
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
      };
      var request = http.Request('POST', Uri.parse(UserUrls.loginUrl));
      request.body = json.encode({"identifier": userEmail, "password": password, "fcm_token": "test"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        debugPrint(responseData.toString());

        token.value = responseData['data']['access_token'];
        refreshToken.value = responseData['data']['refresh_token'];
        Get.close(1);
        if (responseData['data']['is_profile_completed']) {
          await getProfileService(context: context).then((value) {
            role.value == "USER" ? Get.to(() => NavbarScreen()) : Get.to(() => PBottomNavBar());
          });
        } else {
          email.value = userEmail;
          Get.snackbar("Alert", "Please create your profile", backgroundColor: ColorUtils.white);
          Get.toNamed(RouteName.createProfile);
        }
      } else {
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
        debugPrint(response.reasonPhrase);
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
        Get.close(1);
        token.value = responseData['data']['access_token'];
        refreshToken.value = responseData['data']['refresh_token'];

        if (isForgetPassword == true) {
          Get.toNamed(RouteName.resetPassword);
        } else {
          if (role.value == 'USER') {
            Get.toNamed(RouteName.createProfile);
          } else {
            Get.toNamed(RouteName.createProfile);
          }
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
        debugPrint(responseData);
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
        debugPrint(responseData);
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
        debugPrint(responseData);
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
      required var latitude,
      required var longitude,
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
        'gender': gender.toUpperCase(),
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
        'longitude': latitude.toString(),
        'latitude': longitude.toString()
      });
      request.files.add(await http.MultipartFile.fromPath('profile_picture', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.close(1);
        await getProfileService(context: context, isAutoLogin: false).then((value) {
          role.value == "USER" ? Get.to(() => NavbarScreen()) : Get.toNamed(RouteName.cretaetProfileTwoPath);
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

  createJobPerformerProfile(
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
      required String image,
      required String workertype,
      required List professionIds}) async {
    try {
      // log(createProfileController.professionIds.toString());
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

      var request = http.MultipartRequest('POST', Uri.parse(UserUrls.createProviderProfileUrl));
      request.fields.addAll({
        'first_name': firstName,
        'last_name': lastName,
        'description': 'xyz',
        'date_of_birth': '2004-03-04T17:22:09.895Z',
        'contact_email': email,
        'address': address,
        'location': 'USA',
        'longitude': '4234324234',
        'latitude': '342423423',
        'gender': gender.toUpperCase(),
        'worker_type': 'PROFESSIONAL',
      });

      for (var i = 0; i < professionIds.length; i++) {
        request.fields.addAll({"professions[$i]": professionIds[i]['id']});
      }
      request.files.add(await http.MultipartFile.fromPath('profile_picture', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.back();

        await getProfileService(context: context, isAutoLogin: false).then((value) {
          Get.to(() => PBottomNavBar());
        });
      } else {
        log(response.toString());
        Get.back();
      }
    } catch (e) {
      Get.back();

      debugPrint("==> error: ${e.toString()}");
    }
  }

  Future getProfileService({context, isAutoLogin = false}) async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getProfileUrl));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody1 = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody1);
      if (response.statusCode == 200) {
        AuthPreferences.saveAuthTokenAndRole(token.value, jsonResponse['data']['user_type'], refreshToken.value);
        if (role.value == "USER") {
          await hsController.setUserData(JobProviderModel.fromJson(jsonResponse['data']));
          hsController.isLoading.value = true;
          hsController.listOfActiveJobs = await getUserActiveJobs();
          await hsController.getBestPerformers();
          hsController.isLoading.value = false;

          if (isAutoLogin) {
            if (jsonResponse['data']['is_profile_completed']) {
              Get.to(() => NavbarScreen());
            } else {
              Get.toNamed(RouteName.createProfile);
            }
          }
        } else if (role.value == 'PERFORMER' || role.value == 'PROFESSIONAL') {
          await phController.setPerformerData(PerformerModel.fromJson(jsonResponse['data']));
          phController.isLaoding.value = true;
          phController.listOfJobs = await getPerformerJobs();
          phController.isLaoding.value = false;

          if (isAutoLogin) {
            Get.to(() => PBottomNavBar());

            // if (jsonResponse['data']['is_profile_completed']) {
            //   Get.to(PBottomNavBar());
            // } else {
            //   Get.toNamed(RouteName.createProfile);
            // }
          } else {
            Get.to(() => PBottomNavBar());
          }
        }
      } else {
        debugPrint(response.reasonPhrase);
        print(jsonResponse['message']);
        Get.toNamed(RouteName.selectRoleOne);
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

  // user jobs
  createJob({
    required context,
    required String WorkerType,
    required String title,
    required String desc,
    required String location,
    required String lat,
    required String long,
    required String jobDate,
    required String startTime,
    required String jobType,
    required String budgetType,
    required String budget,
    required String address,
    required String city,
    required String state,
    required List images,
  }) async {
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

    try {
      var headers = {'Authorization': token.value};
      var request = http.MultipartRequest('POST', Uri.parse(UserUrls.createJob));
      var body = {
        'worker_type': WorkerType,
        'title': title,
        'description': desc,
        'location': location,
        'latitude': lat.toString(),
        'longitude': long.toString(),
        'job_date': "${jobDate}Z",
        'start_time': "${startTime}Z",
        'job_type': jobType, //'WORKINGHOUR'
        'budget_type': budgetType, //FIXED
        'budget': budget.toString(),
        'address': address,
        'state': state,
        'city': city
      };
      request.fields.addAll(body);

      for (var img in images) {
        // final compressedImg = await compressImage(img);
        request.files.add(await http.MultipartFile.fromPath('job_images', img.path));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var resposeDAta = jsonDecode(await response.stream.bytesToString());
      debugPrint("===> resdata: ${resposeDAta}");

      if (response.statusCode == 200) {
        Get.close(1);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                backgroundColor: ColorUtils.dialogeBGColor,
                content: SizedBox(
                  width: 1.0.sw,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      20.h.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(23.sp),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                        child: Image.asset(
                          ImageAssets.congratulationsIcon,
                          scale: 2,
                        ),
                      ),
                      20.h.verticalSpace,
                      Text(
                        "Congratulations!",
                        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                      ),
                      12.h.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "Your job has been posted successfully!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Container(
                    width: 1.0.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.close(2);
                              Get.toNamed(RouteName.jobPostedScreenPath, arguments: {'jobId': resposeDAta['data']['job_id']});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorUtils.red,
                              ),
                              child: Text(
                                "View Job Details",
                                style: TextStyle(color: ColorUtils.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            });

        // debugPrint(await response.stream.bytesToString());
      } else {
        Get.close(1);
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("===> error: ${e.toString()}");
    }
  }

  getAllJobs({
    required String filter,
  }) async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getAllJobs + filter));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        Map<String, dynamic> jsonResponse = json.decode(responseBody);

        if (jsonResponse.containsKey('data')) {
          List<dynamic> jsonData = jsonResponse['data'];
          List<JobsModel> jobs = jsonData.map((jobJson) => JobsModel.fromJson(jobJson)).toList();
          return jobs;
        } else {
          debugPrint("Error: Data key not found in response.");
          return [];
        }
      } else {
        debugPrint(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
      return [];
    }
  }

  getPerformerAllFilteredJobs({
    required String filter,
  }) async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getPerformerJobs + filter));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        Map<String, dynamic> jsonResponse = json.decode(responseBody);

        if (jsonResponse.containsKey('data')) {
          List<dynamic> jsonData = jsonResponse['data'];
          List<PerformerAllJobsModel> jobs = jsonData.map((jobJson) => PerformerAllJobsModel.fromJson(jobJson)).toList();
          return jobs;
        } else {
          debugPrint("Error: Data key not found in response.");
          return [];
        }
      } else {
        debugPrint(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");
      return [];
    }
  }

  Future getPerformerJobs() async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getPerformerAllJobs));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String perofrmerJobs = await response.stream.bytesToString();

        // Decode the response body
        Map<String, dynamic> jsonResponse = json.decode(perofrmerJobs);

        List<dynamic> jobData = jsonResponse['data'];
        List<PerformerJobsModel> jobs = jobData.map((jobJson) => PerformerJobsModel.fromJson(jobJson)).toList();

        return jobs;
      } else {
        debugPrint(response.reasonPhrase);

        return [];
      }
    } catch (e) {
      debugPrint("==> error: ${e.toString()}");

      return [];
    }
  }

  Future applyPerformerJob({required context, required jobId}) async {
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

    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('POST', Uri.parse(UserUrls.applyPerformerJob + jobId));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.close(1);

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                backgroundColor: ColorUtils.dialogeBGColor,
                content: SizedBox(
                  width: 1.0.sw,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      20.h.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(23.sp),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                        child: Image.asset(
                          ImageAssets.jobDoneIcon,
                          scale: 2,
                        ),
                      ),
                      20.h.verticalSpace,
                      Text(
                        "Thank You!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorUtils.black,
                          fontSize: 22.sp,
                        ),
                      ),
                      20.h.verticalSpace,
                      Text(
                        "Your Application has been submitted",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorUtils.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Container(
                    width: 1.0.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.close(1);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorUtils.red,
                            ),
                            child: Text(
                              "Go Back",
                              style: TextStyle(color: ColorUtils.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            });
      } else {
        Get.close(1);
        Get.snackbar("Alert", "Already Applied!", backgroundColor: ColorUtils.white);
        print(response.reasonPhrase);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e}");
    }
  }

  getSingleJobDetail({required String jobId}) async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getSingleJobDetail + jobId));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String jobsResponse = await response.stream.bytesToString();
        var jobMap = json.decode(jobsResponse);

        return jobMap['data']['job'];
      } else {
        return {};
      }
    } catch (e) {
      debugPrint("====> error: ${e}");
      return {};
    }
  }

  saveUnsaveBookmarkService({required String jobId, context}) async {
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
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('POST', Uri.parse(UserUrls.saveUnsavePBookmark + jobId));

      request.headers.addAll(headers);

      http.StreamedResponse bookmarkResponse = await request.send();
      String jobsResponse = await bookmarkResponse.stream.bytesToString();
      var jobMap = json.decode(jobsResponse);

      if (bookmarkResponse.statusCode == 200) {
        Get.close(1);
        Get.snackbar("Success", jobMap['message'], backgroundColor: ColorUtils.white);
      } else {
        Get.close(1);
        Get.snackbar("Alert", jobMap['message'], backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("====> error: ${e}");
      Get.close(1);
    }
  }

  getUserActiveJobs() async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getUserActiveJobs));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String activeJobsResponse = await response.stream.bytesToString();
        var jobMap = json.decode(activeJobsResponse);

        return jobMap['data'];
      } else {
        return [];
      }
    } catch (e) {
      debugPrint("====> error: ${e}");
      return [];
    }
  }

  getProfessionalBookmarks() async {
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('GET', Uri.parse(UserUrls.getPBookmark));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);

        List<dynamic> data = jsonResponse['data'];
        if (data.isNotEmpty) {
          List<BookMarkModel> bookmarkedJobs = data.map((jobData) {
            return BookMarkModel.fromJson(jobData);
          }).toList();

          return bookmarkedJobs;
        }
        return [];
      } else {
        return [];
      }
    } catch (e) {
      debugPrint("====> error: ${e}");
      return [];
    }
  }

  acceptRejectJobRequest({context, required String id, required String status}) async {
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
    try {
      final postedController = Get.put(PostedJobScreenController());
      var headers = {'Content-Type': 'application/json', 'Authorization': token.value};
      var request = http.Request('PATCH', Uri.parse(UserUrls.acceptRejectJobRequest + id));
      request.body = json.encode({"status": status});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = jsonDecode(await response.stream.bytesToString());
        await postedController.getJobDetail();
        Get.close(2);
        Get.snackbar("Success", data['message'], backgroundColor: ColorUtils.white);
      } else {
        var data = jsonDecode(await response.stream.bytesToString());
        data['message'];
        Get.close(1);
        Get.snackbar("Alert", "Something went wrong", backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("===> error: ${e}");
    }
  }

  editUserService({
    context,
    required about,
    required firstName,
    required lastName,
    required gender,
    required dob,
    required address,
    required location,
    required lat,
    required long,
    required email,
    required phone,
  }) async {
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
    try {
      final bottomController = Get.put(BottomAppBarController());
      var headers = {'Content-Type': 'application/json', 'Authorization': token.value};
      var request =
          role.value == "USER" ? http.Request('PATCH', Uri.parse(UserUrls.editUser)) : http.Request('PATCH', Uri.parse(UserUrls.editProfessional));
      request.body = json.encode({
        "description": about,
        "first_name": firstName,
        "last_name": lastName,
        "longitude": long,
        "latitude": lat,
        "contact_email": email,
        "address": address,
        "location": location,
        // "gender": gender.toString().toUpperCase()
      });
      request.headers.addAll(headers);

      http.StreamedResponse res = await request.send();
      String responseBody1 = await res.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody1);

      if (res.statusCode == 200) {
        var headers1 = {'Authorization': token.value};
        var request1 = http.Request('GET', Uri.parse(UserUrls.getProfileUrl));

        request1.headers.addAll(headers1);

        http.StreamedResponse response = await request1.send();
        String responseBody1 = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody1);
        AuthPreferences.saveAuthTokenAndRole(token.value, jsonResponse['data']['user_type'], refreshToken.value);

        if (role.value == "USER") {
          hsController.setUserData(JobProviderModel.fromJson(jsonResponse['data']));
          hsController.update();
        } else {
          phController.setPerformerData(PerformerModel.fromJson(jsonResponse['data']));
          phController.update();
        }
        Get.close(2);
        bottomController.itemSelect(0);

        Get.snackbar("Success", "Profile update successfully", backgroundColor: ColorUtils.white);
      } else {
        jsonResponse['message'];
        Get.close(1);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("===> error: ${e}");
    }
  }

  updateUserProfilePic({required context, required String image}) async {
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
    try {
      var headers = {'Authorization': token.value};

      var request = http.MultipartRequest('PATCH', Uri.parse(UserUrls.chanegUserProfilePic));
      request.files.add(await http.MultipartFile.fromPath('profile_picture', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.close(1);

        return true;
      } else {
        Get.close(1);
        return false;
      }
    } catch (e) {
      Get.close(1);

      debugPrint("==> error: ${e.toString()}");
      return false;
    }
  }

  sentInviteToPerformer({required String jobId, required String performerId, context}) async {
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
    try {
      var headers = {'Authorization': token.value};
      var request = http.Request('POST', Uri.parse("${UserUrls.sentInviteToPerformer}$jobId&performer_id=$performerId"));

      request.headers.addAll(headers);

      http.StreamedResponse sentInvite = await request.send();
      String jobsResponse = await sentInvite.stream.bytesToString();
      var jobMap = json.decode(jobsResponse);

      if (sentInvite.statusCode == 200) {
        Get.close(1);
        Get.snackbar("Success", jobMap['message'], backgroundColor: ColorUtils.white);
      } else {
        Get.close(1);
        Get.snackbar("Alert", jobMap['message'], backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      debugPrint("====> error: ${e}");
      Get.close(1);
    }
  }
}
