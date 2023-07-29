import 'package:shared_preferences/shared_preferences.dart';

import '../config/network.dart';

class UserService {
  final _client = Network();

  Future<void> updatePin(String pin) async {
    try {
      final result = await _client.put('user/pin', data: {'pin_code': pin});
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('pin', pin);
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<void> verifyPin() async {}
}