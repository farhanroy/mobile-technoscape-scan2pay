import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../config/routes.dart';
import '../controller/controller.dart';

class PinScreen extends GetView<PinController> {
  const PinScreen({super.key});

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
        panel: PinMainPanel(),
        body: const PinBodyPanel(),
      ),
    );
  }
}

class PinMainPanel extends StatelessWidget {
  PinMainPanel({super.key});

  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: Column(
        children: [
          Text(
            'Masukkan Nominal',
            style: TextStyle(
              color: Get.theme.colorScheme.secondary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Pastikan nominal pembayaranmu sudah sesuai',
            style: TextStyle(
              color: Get.theme.colorScheme.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _amountController,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'IDR 0',
              hintStyle: TextStyle(
                color: Get.theme.colorScheme.secondary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
            ),
            style: TextStyle(
              color: Get.theme.colorScheme.secondary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onSubmitted: (_) => Get.toNamed(Routes.summary, arguments: {'id': Get.arguments, 'amount': _amountController.text}),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PinBodyPanel extends StatelessWidget {
  const PinBodyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Text(
          'Jumlah',
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
