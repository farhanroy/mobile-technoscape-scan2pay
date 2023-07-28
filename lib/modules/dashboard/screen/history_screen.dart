import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard.dart';

class HistoryScreen extends GetView<DashboardController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('History Screen'),
      ),
    );
  }
}
