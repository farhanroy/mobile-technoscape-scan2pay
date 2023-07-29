import 'package:get/get.dart';

import '../modules/modules.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const setupPin = '/setupPin';

  static const checkPin = '/checkPin';

  static const dashboard = '/dashboard';
  static const profile = '/profile';
  static const history = '/history';
  static const scanner = '/scanner';
  static const preview = '/preview';
  static const home = '/home';

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
        name: dashboard,
        page: () => const DashboardScreen(),
        binding: DahsboardBinding()),
    GetPage(
        name: profile,
        page: () => const ProfileScreen(),
        binding: ProfileBinding()),
    GetPage(
        name: history,
        page: () => const HistoryScreen(),
        binding: HistoryBinding()),
    GetPage(
        name: scanner,
        page: () => const DashboardScreen(),
        binding: ScannerBinding()),
    GetPage(
      name: preview,
      page: () => PreviewScreen(),
      binding: PreviewBinding(),
    )
  ];
}
