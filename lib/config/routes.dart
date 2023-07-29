import 'package:get/get.dart';

import '../modules/modules.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const setupPin = '/setupPin';

  static const checkPin = '/checkPin';

  static const qrCode = '/qrCode';
  static const pin = '/pin';
  static const summary = '/summary';
  static const summarySuccess = '/summary-success';

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
    GetPage(name: login, page: () => LoginScreen(), binding: LoginBinding()),
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
    GetPage(
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
      page: () => ScanScreen(),
      binding: ScannerBinding(),
    ),
    GetPage(
      name: preview,
      page: () => const PreviewScreen(),
      binding: PreviewBinding(),
    ),
    GetPage(
      name: qrCode,
      page: () => const QRCodeScreen(),
      binding: QRCodeBinding(),
    ),
    GetPage(
      name: pin,
      page: () => const PinScreen(),
      binding: PinBinding(),
    ),
    GetPage(
      name: summary,
      page: () => const SummaryScreen(),
      binding: SummaryBinding(),
    ),
    GetPage(
      name: summarySuccess,
      page: () => const SummarySuccessScreen(),
      binding: SummarySuccessBinding(),
    )
  ];
}
