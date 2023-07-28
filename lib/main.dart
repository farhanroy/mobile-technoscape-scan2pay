import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes.dart';
import 'config/themes.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Themes.appTheme(),
      initialRoute: Routes.register,
      getPages: Routes.list,
    );
  }
}
