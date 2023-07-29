import 'package:get/get.dart';

import '../../modules.dart';

class SummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SummaryController());
  }
}
