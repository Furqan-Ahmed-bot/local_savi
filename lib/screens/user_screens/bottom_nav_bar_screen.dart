import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/bottom_nav_bar_screen_controller.dart';
import 'package:local_saviors/screens/user_screens/home_screen.dart';
import 'package:local_saviors/screens/user_screens/jobs_screen.dart';
import 'package:local_saviors/screens/user_screens/message_dashboard_screen.dart';
import 'package:local_saviors/screens/user_screens/user_profile_screen.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class MyBottomNavigationBar extends GetWidget<BottomNavController> {
  // final List<Widget> _screens = [
  //   HomeScreen(),
  //   ExploreVideosScreen(),
  //   ExploreAudioHomeScreen(),
  //   ExplorePodcastHomeScreen(),
  //   MenuScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: barIcon(
                  ImageAssets.homeIcon, controller.currentIndex.value == 0),
              // activeIcon: barIcon(ImageAssets.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: barIcon(
                  ImageAssets.messagesIcon, controller.currentIndex.value == 1),
              // activeIcon: barIcon(ImageAssets.video),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: barIcon(
                  ImageAssets.jobIcon, controller.currentIndex.value == 2),
              // activeIcon: barIcon(ImageAssets.audio),
              label: 'Audio',
            ),
            BottomNavigationBarItem(
              icon: barIcon(
                  ImageAssets.jobIcon, controller.currentIndex.value == 3),
              // activeIcon: barIcon(ImageAssets.podcast),
              label: 'Podcast',
            ),
            BottomNavigationBarItem(
              icon: barIcon(
                  ImageAssets.profileIcon, controller.currentIndex.value == 4),
              label: 'Menu',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          selectedItemColor: ColorUtils.white,
          unselectedItemColor: Colors.grey,
          onTap: controller.changePage,
          elevation: 10,
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(),
          backgroundColor: ColorUtils.lightBlack.withOpacity(0.75),
        ),
        body: Obx(
          () => IndexedStack(index: controller.currentIndex.value, children: [
            HomeScreen(),
            MessageDashboardScreen(),
            JobsScreen(),
            JobsScreen(),
            UserProfileScreen()
          ]),
        ),
      ),
    );
  }
}

Widget barIcon(String icon, bool isSelected) {
  return Material(
    type: MaterialType.transparency,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        icon,
        color: isSelected ? ColorUtils.white : Colors.grey,
        height: 24,
        width: 24,
      ),
    ),
  );
}
