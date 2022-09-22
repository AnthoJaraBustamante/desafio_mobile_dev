import 'package:desafio_mobile_dev/app/routes/app_routes.dart';
import 'package:desafio_mobile_dev/app/ui/global_widgets/global_textfield.dart';
import 'package:desafio_mobile_dev/app/ui/pages/login_page/controllers/login_controller.dart';
import 'package:desafio_mobile_dev/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create a login page
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Inicia sesión',
                style: TextStyle(
                  fontSize: 30,
                  color: ThemeColor.primary,
                ),
              ),
              Icon(
                Icons.person,
                color: ThemeColor.primary,
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              _LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        id: 'login',
        builder: (_) {
          return Column(
            children: [
              GlobalTextFormField(
                controller: _.emailController,
                labelText: 'Usuario',
                prefixIcon: Icons.person,
                validator: _.userValidator,
              ),
              const SizedBox(
                height: 20,
              ),
              GlobalTextFormField(
                controller: _.passwordController,
                prefixIcon: Icons.lock,
                labelText: 'Contraseña',
                obscureText: true,
                suffix: const Icon(Icons.visibility),
                validator: _.passwordValidator,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_.isValidForm()) {
                    await _.loading();
                    Get.offAllNamed(AppRoutes.upload);
                    return;
                  }
                },
                child: Text(_.isLoading ? 'Cargando...' : 'Inicia sesión'),
              ),
            ],
          );
        });
  }
}
