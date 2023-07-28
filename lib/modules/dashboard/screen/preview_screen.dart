import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard.dart';

class PreviewScreen extends GetView<DashboardController> {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Preview Screen'),
      ),
    );
  }
}
