import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.toNamed(Routes.login));
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
            Text(Constants.appName, style: Get.textTheme.titleMedium)
          ],
        ),
      ),
    );
  }
}
