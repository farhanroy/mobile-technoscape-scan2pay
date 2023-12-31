import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../config/routes.dart';
import '../controller/setup_pin_controller.dart';

class SetupPinScreen extends GetView<SetupPinController> {
  const SetupPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final erroredPinTheme = PinTheme(
      width: 20,
      height: 20,
      textStyle: TextStyle(color: Get.theme.primaryColor),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final followedPindTheme = PinTheme(

      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: const Color(0xFF94A3B8)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final defaultPinTheme = PinTheme(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        //color: Get.theme.primaryColor,
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.grey,
      border: Border.all(color: const Color(0xFF94A3B8)),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Get.theme.primaryColor,
      borderRadius: BorderRadius.circular(20),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Setup Pin',
              style: TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/setup-pin.png',
              width: Get.width * 0.5,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: Get.width * 0.6,
              child: const Text(
                'Buatlah pin yang susah ditebak agar transaksimu semakin aman 🔒',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 28),
            Pinput(
              crossAxisAlignment: CrossAxisAlignment.center,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              errorPinTheme: erroredPinTheme,
              followingPinTheme: followedPindTheme,
              length: 6,
              obscureText: true,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: false,
              onCompleted: (value) {
                controller.submit(value).then((value) => Get.toNamed(Routes.dashboard));
              },
            ),
          ],
        ),
      ),
    );
  }
}
