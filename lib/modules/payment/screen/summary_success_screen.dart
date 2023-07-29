import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../config/routes.dart';
import '../../../widgets/widgets.dart';

class SummarySuccessScreen extends StatelessWidget {
  const SummarySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 610,
        maxHeight: 610,
        borderRadius: BorderRadiusGeometry.lerp(
          const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          1,
        ),
        panel: const SummarySuccessMainPanel(),
        body: const SummarySuccessBodyPanel(),
      ),
    );
  }
}

class SummarySuccessMainPanel extends StatelessWidget {
  const SummarySuccessMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.green),
            Text(
              'IDR 41.000,-',
              style: TextStyle(
                color: Get.theme.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text('Pembayaran Berhasil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )),
            Text('Pembayaran Berhasil',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Harga',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    Text('IDR 100.000,-',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Diskon',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    Text('IDR 0,-',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Pembayaran',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    Text('IDR 100.000,-',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                CommonButton(
                  titleColor: Get.theme.colorScheme.secondary,
                  color: Get.theme.primaryColor,
                  title: 'Bayar',
                  onTap: () {
                    Get.toNamed(Routes.dashboard);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SummarySuccessBodyPanel extends StatelessWidget {
  const SummarySuccessBodyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Text(
          'Ringkasan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Get.theme.colorScheme.secondary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Get.theme.colorScheme.secondary,
      ),
    );
  }
}
