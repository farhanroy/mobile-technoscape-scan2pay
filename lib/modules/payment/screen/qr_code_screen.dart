import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../config/routes.dart';
import '../payment.dart';

class QRCodeScreen extends GetView<QRCodeController> {
  const QRCodeScreen({super.key});

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
        panel: const QRCodeMainPanel(),
        body: const QRCodeBodyPanel(),
      ),
    );
  }
}

class QRCodeMainPanel extends StatelessWidget {
  const QRCodeMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: Column(
        children: [
          Text(
            'Kode Scan2Pay',
            style: TextStyle(
              color: Get.theme.colorScheme.secondary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text('Tunjukkan QR ini pada saat pembayaran',
              style: TextStyle(
                color: Get.theme.colorScheme.secondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(height: 60),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: 328,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Limit Tersisa',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                )),
                            Text('IDR 2.500.000,-',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Scan2Pay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 197,
                      width: 197,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Image.asset('assets/images/qr-code.png'),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border.all(
                    color: Get.theme.primaryColor,
                    width: 1.0,
                  ),
                ),
                child: TextButton(
                  onPressed: () => Get.toNamed(Routes.pin),
                  child: Text('Request Kode Baru',
                      style: TextStyle(
                        color: Get.theme.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QRCodeBodyPanel extends StatelessWidget {
  const QRCodeBodyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Text(
          'QR Code',
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
