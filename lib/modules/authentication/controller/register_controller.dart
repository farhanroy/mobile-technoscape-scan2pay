import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../../services/user_service.dart';
import '../../../models/user_model.dart';

class RegisterController extends GetxController {
  final isObscure = true.obs;
  final isLoading = false.obs;

  final selectedGender = 0.obs;
  final genderList = ['Laki Laki', 'Perempuan'];

  final _authService = AuthService();
  final _userService = UserService();

  void changeGender(int value) {
    selectedGender.value = value;
  }

  Future<void> submit(UserModel userModel) async {
    isLoading.value = true;
    try {
      final result = await _authService.register(userModel.toJson());
      await _authService.login(userModel.email!, userModel.password!);
      await _userService.createBankAccount();
      isLoading.value = false;
    } catch(e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }
}
