import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../models/user_model.dart';
import '../../../widgets/widgets.dart';
import '../authentication.dart';

class RegisterScreen extends GetView<RegisterController> {
  RegisterScreen({super.key});

  final _ktpController = TextEditingController();
  final _nameController = TextEditingController();
  // final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: paddingTop),
        color: const Color(0xFF334155),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: Get.height * 0.2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', width: 20),
                  const SizedBox(width: 20),
                  const Text(
                    'Daftar Akun',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height * 0.788,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextField(
                      controller: _ktpController,
                      decoration: const InputDecoration(
                        labelText: 'Nomor Induk',
                        hintText: 'Masukkan nomor induk',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                        hintText: 'Masukkan nama',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // TextField(
                    //   controller: _usernameController,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Username',
                    //     hintText: 'Masukkan username',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Nomor Telp',
                        hintText: '08XXXX',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.width,
                      child: Obx(() => DropdownButtonFormField<int>(
                            value: controller.selectedGender.value,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            items: [0, 1].map((int items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(controller.genderList[items]),
                              );
                            }).toList(),
                            onChanged: (int? value) =>
                                controller.changeGender(value!),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _birthDateController,
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime(2002),
                        firstDate: DateTime(1945),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        _birthDateController.text = value!.toIso8601String();
                      }),
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Lahir',
                        hintText: 'DD-MM-YYYY',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Masukkan password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isObscure.value =
                                      !controller.isObscure.value;
                                },
                                icon: Icon(controller.isObscure.isTrue
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        )),
                    const SizedBox(height: 20),
                    Obx(() => TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Konfirmasi Password',
                            hintText: 'Masukkan password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isObscure.value =
                                      !controller.isObscure.value;
                                },
                                icon: Icon(controller.isObscure.isTrue
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        )),
                    const SizedBox(height: 20),
                    // elevated button #FACC15
                    Obx(() {
                      if (controller.isLoading.isTrue) {
                        return ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white54,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const CircularProgressIndicator());
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            final userModel = UserModel(
                                ktp: _ktpController.text,
                                name: _nameController.text,
                                password: _passwordController.text,
                                phoneNumber: _phoneController.text,
                                birthDate: _birthDateController.text,
                                gender: controller.selectedGender.value,
                                email: _emailController.text);
                            controller
                                .submit(userModel)
                                .then((value) => Get.toNamed(Routes.setupPin))
                                .catchError((e) =>
                                    Fluttertoast.showToast(msg: e.toString()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Get.theme.primaryColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }
                    }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sudah punya akun?'),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.login),
                          child: const Text('Masuk'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CommonButton(
                      titleColor: Get.theme.colorScheme.secondary,
                      color: Get.theme.primaryColor,
                      title: 'Daftar',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sudah punya akun?'),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.login),
                          child: const Text('Masuk'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
