import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../config/routes.dart';
import '../dashboard.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() => [
          const HomeScreen(),
          const PreviewScreen(),
          const ScannerScreen(),
          const HistoryScreen(),
          const ProfileScreen(),
        ];

    List<PersistentBottomNavBarItem> navBarsItems() => [
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.home_outlined,
              size: 30,
            ),
            title: "Home",
            activeColorPrimary: Get.theme.primaryColor,
            inactiveColorPrimary: Colors.grey,
            inactiveColorSecondary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.preview_outlined,
              size: 30,
            ),
            title: "Pratinjau",
            activeColorPrimary: Get.theme.primaryColor,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.qr_code_2,
              size: 30,
              color: Colors.black54,
            ),
            activeColorPrimary: Get.theme.primaryColor,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.history_edu_outlined,
              size: 30,
            ),
            title: "Riwayat",
            activeColorPrimary: Get.theme.primaryColor,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.person_3_outlined,
              size: 30,
            ),
            title: "Profil",
            activeColorPrimary: Get.theme.primaryColor,
            inactiveColorPrimary: Colors.grey,
          ),
        ];

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: buildScreens(),
        onPageChanged: (index) {
          // Update the selected tab index when the PageView changes.
          PersistentTabController().jumpToTab(index);
        },
      ),
      bottomNavigationBar: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: 0),
        onItemSelected: (index) {
          print(index);
          if (index == 2) {
            Get.toNamed(Routes.scanner);
          }
        },
        screens: buildScreens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        navBarStyle: NavBarStyle.style15,

      )
    );
  }
}
