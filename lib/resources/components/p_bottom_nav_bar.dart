// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_home_controller.dart';
import 'package:local_saviors/screens/professional_screens/p_home_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_jobs_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_message_dashboard_screen.dart';
import 'package:local_saviors/screens/professional_screens/p_saved_jobs_screen.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import '../../utils/color_utils.dart';

class PBottomNavBar extends StatefulWidget {
  PBottomNavBar({Key? key});

  @override
  State<PBottomNavBar> createState() => _PBottomNavBarState();
}

bool subcription = false;

class _PBottomNavBarState extends State<PBottomNavBar> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final bottomController = Get.put(PBottomAppBarController());
  final performerData = Get.put(PHomeController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white,
          systemNavigationBarColor: const Color(0xff4E7095)),
      child: GetBuilder(
          init: bottomController,
          builder: (controller) {
            return Container(
              child: Scaffold(
                key: _key,
                drawer: Container(
                  child: Stack(clipBehavior: Clip.none, children: [
                    Drawer(
                      width: 300,
                      child: Container(
                        height: 1.sh,
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: [
                              Color(0xFFD6EFFF), // Light blue shade for the top
                              Color(0xFFFFFFFF),
                            ],
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  70.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            ImageAssets.oliverDetailImg),
                                        height: 90,
                                      )
                                      // Container(
                                      //   height: 140.h,
                                      //   width: 140.w,
                                      //   decoration: BoxDecoration(
                                      //     border: Border.all(
                                      //         color: Colors.white, width: 5),
                                      //     shape: BoxShape.circle,
                                      //   ),
                                      //   child: CircleAvatar(
                                      //     backgroundImage:
                                      //         AssetImage("assets/profile.png"),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  16.verticalSpace,
                                  Center(
                                    child: Text(
                                      '${performerData.performerdata.userDetails?.firstName}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    '${performerData.performerdata.userDetails?.contactEmail}',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  )
                                ],
                              ),
                              60.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    40.horizontalSpace,
                                    Image.asset(
                                      ImageAssets.drawerHome,
                                      scale: 2,
                                    ),
                                    20.horizontalSpace,
                                    Text(
                                      "Home",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              40.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  Get.back();

                                  Get.toNamed(RouteName.pMyProfileScreenPath);
                                },
                                child: Row(
                                  children: [
                                    40.horizontalSpace,
                                    Image.asset(
                                      ImageAssets.drawerProfile,
                                      scale: 2,
                                    ),
                                    20.horizontalSpace,
                                    Text(
                                      "My Profile",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              40.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.walletScreen);
                                  // Get.to(() => goalsHistoryScreen());
                                },
                                child: Row(
                                  children: [
                                    40.horizontalSpace,
                                    Image.asset(
                                      ImageAssets.drawerWallet,
                                      scale: 2,
                                    ),
                                    20.horizontalSpace,
                                    Text(
                                      "My Wallet",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              40.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  Get.back();

                                  Get.toNamed(
                                      RouteName.pNotificaitonScreenPath);
                                },
                                child: Row(
                                  children: [
                                    40.horizontalSpace,
                                    Image.asset(
                                      ImageAssets.drawerNotification,
                                      scale: 2,
                                    ),
                                    20.horizontalSpace,
                                    Text(
                                      "Notifications",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              40.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  Get.back();

                                  Get.toNamed(
                                      RouteName.pHelpFeedbackScreenPath);
                                },
                                child: Row(
                                  children: [
                                    40.horizontalSpace,
                                    Image.asset(
                                      ImageAssets.drawerHelp,
                                      scale: 2,
                                    ),
                                    20.horizontalSpace,
                                    Text(
                                      "Help & Feedback",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              40.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  // Get.to(() => settingsScreen());
                                  Get.back();
                                  Get.toNamed(RouteName.settingScreenPath);
                                },
                                child: Row(
                                  children: [
                                    40.horizontalSpace,
                                    Image.asset(
                                      ImageAssets.drawerSetting,
                                      scale: 2,
                                    ),
                                    20.horizontalSpace,
                                    Text(
                                      "Settings",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              40.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          backgroundColor:
                                              ColorUtils.dialogeBGColor,
                                          content: SizedBox(
                                            width: 1.0.sw,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                20.h.verticalSpace,
                                                Container(
                                                  padding:
                                                      EdgeInsets.all(23.sp),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorUtils.jobIconBG),
                                                  child: Image.asset(
                                                    ImageAssets.logoutBigIcon,
                                                    scale: 2,
                                                  ),
                                                ),
                                                20.h.verticalSpace,
                                                Text(
                                                  "Logout!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorUtils.black,
                                                    fontSize: 22.sp,
                                                  ),
                                                ),
                                                24.h.verticalSpace,
                                                Text(
                                                  "Are you sure you want to Logout?",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorUtils.black,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            Container(
                                              width: 1.0.sw,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.offAllNamed(
                                                            RouteName
                                                                .selectRoleOne);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 15.h),
                                                        decoration: BoxDecoration(
                                                            color: ColorUtils
                                                                .white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                                width: 1.w,
                                                                color: ColorUtils
                                                                    .borderColor)),
                                                        child: const Text(
                                                            "Yes, Select"),
                                                      ),
                                                    ),
                                                  ),
                                                  20.w.horizontalSpace,
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 15.h),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          color: ColorUtils.red,
                                                        ),
                                                        child: Text(
                                                          "No",
                                                          style: TextStyle(
                                                              color: ColorUtils
                                                                  .white),
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
                                },
                                child: Container(
                                  width: 0.55.sw,
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.red,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.r),
                                          bottomRight: Radius.circular(20.r))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      40.horizontalSpace,
                                      Image.asset(
                                        ImageAssets.drawerLogout,
                                        scale: 2,
                                      ),
                                      20.horizontalSpace,
                                      Text(
                                        "Logout",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              20.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 280,
                        top: 30,
                        child: InkWell(
                            onTap: () {
                              Get.close(1);
                            },
                            child: Image.asset(ImageAssets.closeDrawer)))
                  ]),
                ),

                appBar: bottomController.count == 0
                    ? AppBar(
                        leading: InkWell(
                          onTap: () {
                            _key.currentState!.openDrawer();
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20.w, right: 10.w),
                            // padding: EdgeInsets.all(8.sp),
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.appbarButtonBG),
                            child: Image.asset(
                              ImageAssets.menunicon,
                              scale: 2,
                            ),
                          ),
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteName.pNotificaitonScreenPath);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 20.w),
                              padding: EdgeInsets.all(8.sp),
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.appbarButtonBG),
                              child: Image.asset(
                                ImageAssets.notificationicon,
                                scale: 2,
                              ),
                            ),
                          ),
                        ],
                        title: Image.asset(
                          ImageAssets.logoSamll,
                          scale: 2,
                        ),
                        centerTitle: true,
                        elevation: 0,
                        backgroundColor: ColorUtils.primary,
                      )
                    : bottomController.count == 1
                        ? AppBar(
                            leading: InkWell(
                              onTap: () {
                                _key.currentState!.openDrawer();
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 20.w, right: 10.w),
                                // padding: EdgeInsets.all(8.sp),
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.appbarButtonBG),
                                child: Image.asset(
                                  ImageAssets.menunicon,
                                  scale: 2,
                                ),
                              ),
                            ),
                            actions: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RouteName.pNotificaitonScreenPath);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.w),
                                  padding: EdgeInsets.all(8.sp),
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorUtils.appbarButtonBG),
                                  child: Image.asset(
                                    ImageAssets.notificationicon,
                                    scale: 2,
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              "Messages",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                            centerTitle: true,
                            elevation: 0,
                            backgroundColor: ColorUtils.primary,
                          )
                        : bottomController.count == 3
                            ? AppBar(
                                leading: InkWell(
                                  onTap: () {
                                    _key.currentState!.openDrawer();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20.w, right: 10.w),
                                    // padding: EdgeInsets.all(8.sp),
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.appbarButtonBG),
                                    child: Image.asset(
                                      ImageAssets.menunicon,
                                      scale: 2,
                                    ),
                                  ),
                                ),
                                actions: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RouteName.pNotificaitonScreenPath);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20.w),
                                      padding: EdgeInsets.all(8.sp),
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.appbarButtonBG),
                                      child: Image.asset(
                                        ImageAssets.notificationicon,
                                        scale: 2,
                                      ),
                                    ),
                                  ),
                                ],
                                title: Text(
                                  "Jobs",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                centerTitle: true,
                                elevation: 0,
                                backgroundColor: ColorUtils.primary,
                              )
                            : AppBar(
                                leading: InkWell(
                                  onTap: () {
                                    _key.currentState!.openDrawer();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20.w, right: 10.w),
                                    // padding: EdgeInsets.all(8.sp),
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.appbarButtonBG),
                                    child: Image.asset(
                                      ImageAssets.menunicon,
                                      scale: 2,
                                    ),
                                  ),
                                ),
                                actions: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RouteName.pNotificaitonScreenPath);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20.w),
                                      padding: EdgeInsets.all(8.sp),
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.appbarButtonBG),
                                      child: Image.asset(
                                        ImageAssets.notificationicon,
                                        scale: 2,
                                      ),
                                    ),
                                  ),
                                ],
                                title: Text(
                                  "Saved Jobs",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                centerTitle: true,
                                elevation: 0,
                                backgroundColor: ColorUtils.primary,
                              ),
                extendBody: true,
                // extendBody: true, extendBodyBehindAppBar: true,
                backgroundColor: Colors.white,
                bottomNavigationBar: buildMyNavBar2(context),

                // drawer: DrawerWidget(),
                body: bottomController.bottomList[bottomController.count.value]
                    ['page'] as Widget,
              ),
            );
          }),
    );
  }

  buildMyNavBar2(BuildContext context) {
    return Container(
      //height: 100.h,
      color: Color.fromARGB(255, 247, 251, 255),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.none,
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 95.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffB2C2DC80)),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 24,
                //     color: Color(0xffB2C2DC80),
                //   ),
                // ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bottomBarItem2(0),
                      ],
                    ),
                    Row(
                      children: [
                        bottomBarItem2(1),
                      ],
                    ),

                    Row(
                      children: [
                        bottomBarItem2(2),
                      ],
                    ),
                    Row(
                      children: [
                        bottomBarItem2(3),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     bottomBarItem2(4),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomBarItem2(index) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        bottomController.itemSelect(index);
      },
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image.asset(
                    bottomController.bottomList[index]["unfocused_image"]
                        .toString(),
                    height: 20,
                  ),
                ],
              ),
              bottomController.count.value == index
                  ? 6.verticalSpace
                  : 8.verticalSpace,
              Text(
                bottomController.bottomList[index]['title'].toString(),
                style: TextStyle(color: Colors.black, fontSize: 11.sp),
              ),
            ],
          ),
          if (bottomController.count.value == index)
            Positioned(
              top: -6,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 3.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: ColorUtils.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  // child: Image.asset(
                  //   bottomController.bottomList[index]["focused_image"]
                  //       .toString(),
                  //   scale: 2.2,
                  // ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class PBottomAppBarController extends GetxController {
  TextEditingController controller = TextEditingController(text: "Search");

  var count = 0.obs;
  var bottomList = [
    {
      'title': 'Home',
      'page': PHomeScreen(),
      'isSelect': true,
      'focused_image': ImageAssets.threeDots,
      'unfocused_image': 'assets/icons/bottomhome.png',
    },
    {
      'title': 'Message',
      'page': PMessageDashboardScreen(),
      'isSelect': true,
      'focused_image': ImageAssets.threeDots,
      'unfocused_image': 'assets/icons/bottomchat.png',
    },
    {
      'title': 'Saved Jobs',
      'page': PSavedJobsScreen(),
      'isSelect': true,
      'focused_image': ImageAssets.threeDots,
      'unfocused_image': 'assets/icons/bottomsaved.png',
    },
    {
      'title': 'Jobs',
      'page': PJobsScreen(),
      'isSelect': true,
      'focused_image': ImageAssets.threeDots,
      'unfocused_image': 'assets/icons/bottomjob.png',
    },
    // {
    //   'title': 'Profile',
    //   'page': HomeScreen(),
    //   'isSelect': true,
    //   'focused_image': ImageAssets.applyJobs,
    //   'unfocused_image': ImageAssets.applyJobs,
    // },
  ];
  itemSelect(index) {
    count.value = index;
    update();
  }
}
