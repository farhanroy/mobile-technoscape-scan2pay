import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controller/controller.dart';

class SetupPinScreen extends GetView<SetupPinController> {
  const SetupPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final erroredPinTheme = PinTheme(
      width: 20,
      height: 20,
      textStyle: TextStyle(color: Get.theme.primaryColor),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF94A3B8)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final defaultPinTheme = PinTheme(
      width: 20,
      height: 20,
      textStyle: TextStyle(color: Get.theme.primaryColor),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF94A3B8)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
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
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              errorPinTheme: erroredPinTheme,
              validator: (s) {
                return s == '222222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: false,
              onCompleted: (pin) {
                if (kDebugMode) print(pin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
