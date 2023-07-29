import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_model.dart';
import '../../../services/user_service.dart';

class ProfileController extends GetxController with StateMixin<UserModel> {

  final _userService = UserService();

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    try {
      final result = await _userService.getUser();
      change(result, status: RxStatus.success());
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    try {
      final pref = await SharedPreferences.getInstance();
      pref.remove('token');
      pref.clear();
    } catch(e) {
      throw Exception(e);
    }
  }
}
