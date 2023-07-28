import 'package:get/get.dart';
import 'package:scan2pay/modules/authentication/authentication.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
