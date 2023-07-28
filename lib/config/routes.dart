import 'package:get/get.dart';
import 'package:scan2pay/modules/authentication/authentication.dart';

import '../modules/modules.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';

  static final list = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: register,
        page: () => RegisterScreen(),
        binding: RegisterBinding())
  ];
}
