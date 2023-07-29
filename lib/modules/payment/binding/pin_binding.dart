import 'package:get/get.dart';

class PinBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PinBinding());
  }
}
