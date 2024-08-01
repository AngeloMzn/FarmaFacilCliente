import 'package:flutter/material.dart';

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

  void submitForm(GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      debugPrint("válido");
    } else {
      debugPrint("não válido");
    }
  }
}
