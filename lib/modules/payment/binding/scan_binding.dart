import 'package:get/get.dart';

import '../payment.dart';

class ScanBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ScanController());
  }
}
