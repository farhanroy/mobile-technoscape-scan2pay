import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';

class ScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
