import 'package:get/get.dart';

import '../payment.dart';

class QRCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QRCodeController());
  }
}
