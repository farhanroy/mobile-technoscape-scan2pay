import 'package:get/get.dart';

import '../controller/check_pin_controller.dart';

class CheckPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckPinController>(CheckPinController());
  }
}