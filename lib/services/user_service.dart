import 'package:shared_preferences/shared_preferences.dart';

import '../config/network.dart';
import '../models/user_model.dart';

class UserService {
  final _client = Network();

  Future<void> updatePin(String pin) async {
    try {
      final result = await _client.postWithToken('app/user/pin', data: {'pin_code': pin});
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('pin', pin);
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<void> verifyPin() async {}

  Future<void> createBankAccount() async {
    try {
      final result = await _client.postWithToken('app/user/bank-account/activation', data: {'balance': 1000});
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<UserModel> getUser() async {
    try {
      final result = await _client.getWithToken('app/user');
      Map responseData = result.data as Map<String, dynamic>;
      return UserModel.fromJson(responseData['data']);
    } catch(e) {
      throw Exception(e);
    }
  }
}