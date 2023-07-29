import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';

class PreviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
