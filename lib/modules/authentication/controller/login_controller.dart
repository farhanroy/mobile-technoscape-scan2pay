import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  final isObscure = true.obs;
  final isLoading = false.obs;

  final _authService = AuthService();

  Future<void> submit(String email, String password) async {
    isLoading.value = true;
    try {
      final result = await _authService.login(email, password);
      isLoading.value = false;
    } catch(e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }
}