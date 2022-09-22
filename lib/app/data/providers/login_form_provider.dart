import 'package:flutter/cupertino.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
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
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> loading() async {
    //simula un loading al iniciar sesión
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
  }
}
