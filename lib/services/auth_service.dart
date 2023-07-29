import 'package:shared_preferences/shared_preferences.dart';

import '../config/network.dart';
import '../models/user_model.dart';

class AuthService {
  final _client = Network();

  Future<UserModel> login(String email, String password) async {
    try {
      final data = {'email': email, 'password': password};
      final result = await _client.post('auth/login', data: data);
      final prefs = await SharedPreferences.getInstance();
      Map responseData = result.data as Map<String, dynamic>;
      await prefs.setString('token', responseData['token']);
      await prefs.setString('id',responseData['data']['ID']);
      return UserModel.fromJson(responseData['data']);
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<void> register(Map data) async {
    try {
      final result = await _client.post('auth/signup', data: data);
    } catch(e) {
      throw Exception(e);
    }
  }
}
