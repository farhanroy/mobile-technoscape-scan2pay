import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
