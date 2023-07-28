import 'package:get/get.dart';
import 'package:scan2pay/modules/authentication/controller/controller.dart';

class SetupPinBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SetupPinController());
  }
}
