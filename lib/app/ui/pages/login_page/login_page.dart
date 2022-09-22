import 'package:desafio_mobile_dev/app/data/providers/login_form_provider.dart';
import 'package:desafio_mobile_dev/app/routes/app_routes.dart';
import 'package:desafio_mobile_dev/app/ui/global_widgets/global_textfield.dart';
import 'package:desafio_mobile_dev/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            children: [
              const Text(
                'Inicia sesión',
                style: TextStyle(
                  fontSize: 30,
                  color: ThemeColor.primary,
                ),
              ),
              const Icon(
                Icons.person,
                color: ThemeColor.primary,
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: const _LoginForm(),
              ),
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
    final LoginFormProvider loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          GlobalTextFormField(
            labelText: 'Usuario',
            prefixIcon: Icons.person,
            validator: loginForm.userValidator,
          ),
          const SizedBox(
            height: 20,
          ),
          GlobalTextFormField(
            prefixIcon: Icons.lock,
            labelText: 'Contraseña',
            obscureText: true,
            suffix: const Icon(Icons.visibility),
            validator: loginForm.passwordValidator,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (loginForm.isValidForm()) {
                await loginForm.loading();
                Navigator.pushReplacementNamed(context, AppRoutes.upload);
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Usuario o contraseña incorrectos'),
                ),
              );
            },
            child: Text(loginForm.isLoading ? 'Cargando...' : 'Inicia sesión'),
          ),
        ],
      ),
    );
  }
}
