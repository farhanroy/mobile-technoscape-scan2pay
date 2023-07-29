import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard.dart';

class ScannerScreen extends GetView<DashboardController> {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Scanner Screen'),
      ),
    );
  }
}
