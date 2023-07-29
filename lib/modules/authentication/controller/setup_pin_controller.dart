import 'package:get/get.dart';

import '../../../services/user_service.dart';

class SetupPinController extends GetxController {
  final _userService = UserService();

  Future<void> submit(String pin) async {
    try {
      await _userService.updatePin(pin);
    } catch(e) {
      throw Exception(e);
    }
  }
}
