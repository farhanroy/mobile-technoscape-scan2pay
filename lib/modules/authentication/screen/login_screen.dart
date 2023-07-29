import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Get.theme.colorScheme.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/images/logo.png', width: 20, height: 26,),
                const SizedBox(height: 40),
                const Text('Halo, Selamat Datang \n di Scan2Pay 👋',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)
                ),
                const SizedBox(height: 24),
                const Text('Silahkan login menggunakan akun kamu',
                    style: TextStyle(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height * 0.6955,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email'
                    ),
                    controller: _emailController,
                  ),
                  const SizedBox(height: 24),
                  Obx(() => TextField(
                    obscureText: controller.isObscure.value,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isObscure.value = !controller.isObscure.value;
                            }, icon: Icon(controller.isObscure.isTrue ? Icons.visibility : Icons.visibility_off))
                    ),
                    controller: _passwordController,
                  )),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {} ,
                        child: Text('Lupa Password ?')
                    ),
                  ),
                  Obx(() {
                      if (controller.isLoading.isTrue) {
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white60,
                            minimumSize: Size(Get.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const CircularProgressIndicator(),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            controller.submit(_emailController.text, _passwordController.text)
                                .then((value) {
                                  Get.toNamed(Routes.setupPin);
                            })
                                .catchError((e) {
                              Fluttertoast.showToast(
                                  msg: e.toString(),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Get.theme.primaryColor,
                            minimumSize: Size(Get.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }
                    }
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun? '),
                      TextButton(
                          onPressed: () => Get.toNamed(Routes.register) ,
                          child: Text('Dafter')
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}