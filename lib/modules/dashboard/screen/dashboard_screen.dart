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
              Icons.adf_scanner_outlined,
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
        body: PersistentTabView(
      context,
      padding: const NavBarPadding.only(bottom: 15),
      navBarHeight: 80,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
          onItemSelected: (index) {
            print(index);
            if (index == 2) {
              Get.toNamed(Routes.scanner);
            }
          },
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    ));
  }
}
