import 'package:farmafacil_cliente/database/authentication.dart';
import 'package:farmafacil_cliente/screens/home_screen.dart';
import 'package:farmafacil_cliente/utils/login_cookie.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginController {
  bool hidePassword = true;
  IconData passwordIcon = Icons.visibility_off;

  void togglePasswordVisibility() {
    hidePassword = !hidePassword;

    if (hidePassword) {
      passwordIcon = Icons.visibility_off;
    } else {
      passwordIcon = Icons.visibility;
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

    RegExp regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Insira o e-mail.';
    } else if (!regExp.hasMatch(value)) {
      return 'Insira um e-mail válido.';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Insira a senha";
    }

    return null;
  }

  void login(
    GlobalKey<FormState> key,
    BuildContext context,
    String email,
    String password,
  ) {
    if (key.currentState!.validate()) {
      final progress = ProgressHUD.of(context);
      progress?.showWithText('Verificando...');

      FocusManager.instance.primaryFocus?.unfocus();
      Authentication.login(email, password).then((requestResponse) {
        progress?.dismiss();

        if (requestResponse.statusCode == 200) {
          LoginCookie.save();
          Navigate.navigateAndRemoveAllRoutes(context, const HomeScreen());
        } else {
          const snackBar = SnackBar(
            content: Text(
              "Credenciais inválidas, email e/ou senha incorretos!",
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }
}
