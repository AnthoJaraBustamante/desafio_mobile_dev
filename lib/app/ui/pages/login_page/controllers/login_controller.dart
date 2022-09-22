import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  String? Function(String? value) userValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu usuario';
    }
    return null;
  };

  String? Function(String? value) passwordValidator = (String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  };

  bool isValidForm() {
    if (emailController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Ingresa tu usuario'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Ingresa tu contraseña'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> loading() async {
    //simula un loading al iniciar sesión
    //cerrar teclado 
    Get.focusScope?.unfocus();
    isLoading = true;
    update(['login']);
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    update(['login']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
