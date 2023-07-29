import 'package:get/get.dart';

import '../controller/controllers.dart';

class DahsboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(ProfileController());
  }
}
