import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/routes.dart';
import '../../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkIsLogin();
  }

  Future<void> checkIsLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    if (token == null) {
      Get.toNamed(Routes.login);
    } else {
      Get.toNamed(Routes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 10),
            Text(Constants.appName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ))
          ],
        ),
      ),
    );
  }
}
