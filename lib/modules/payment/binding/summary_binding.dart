import 'package:get/get.dart';

import '../controller/summary_controller.dart';

class SummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SummaryController());
  }
}
