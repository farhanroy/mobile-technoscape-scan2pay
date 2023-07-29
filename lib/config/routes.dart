import 'package:get/get.dart';

import '../modules/modules.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const setupPin = '/setupPin';
  static const checkPin = '/checkPin';

  static final list = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: login,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: register,
        page: () => RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: setupPin,
        page: () => const SetupPinScreen(),
        binding: SetupPinBinding()),
    GetPage(
        name: checkPin,
        page: () => const CheckPinScreen(),
        binding: CheckPinBinding()),
  ];
}
