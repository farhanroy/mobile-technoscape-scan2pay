import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../config/routes.dart';
import '../payment.dart';

class ScanScreen extends GetView<ScanController> {
  ScanScreen({super.key});

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controllerScanner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'QR Scan',
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
          onPressed: () {
            controllerScanner?.dispose();
            Get.offNamed(Routes.dashboard);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Center(
                child: (result != null)
                    // ? Text(
                    //     'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                    ? const Text('')
                    : const Text(''),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 80,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => controllerScanner?.toggleFlash(),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Get.theme.primaryColor,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.flash_on),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Flash',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 80,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // add qr scan configuration here
                    result != null
                        ? Get.toNamed(Routes.qrCode)
                        : Get.toNamed(Routes.qrCode);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Get.theme.primaryColor,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.qr_code),
                ),
                const SizedBox(height: 5),
                const Text(
                  'QR Code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controllerScanner = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (scanData.code != null) {
        print(scanData.code);
        Get.toNamed(Routes.pin, arguments: scanData.code);
      }
    });
  }
}
