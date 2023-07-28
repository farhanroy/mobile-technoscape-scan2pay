import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controller/check_pin_controller.dart';

class CheckPinScreen extends GetView<CheckPinController> {
  const CheckPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/logo.png',
                  width: 20,
                  height: 26,
                ),
                const SizedBox(height: 40),
                const Text('Halo, Selamat Datang \n di Scan2Pay 👋',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                const SizedBox(height: 24),
                const Text('Silahkan login menggunakan akun kamu',
                    style: TextStyle(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height * 0.6955,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text('Masukan PIN',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  const SizedBox(height: 20),
                  Pinput(
                    defaultPinTheme: PinTheme(
                      width: 20,
                      height: 20,
                      textStyle: TextStyle(color: Get.theme.primaryColor),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF94A3B8)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    showCursor: false,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
