import 'package:get/get.dart';

import '../../modules.dart';

class SummarySuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SummarySuccessController());
  }
}
