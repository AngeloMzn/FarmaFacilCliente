import 'package:flutter/material.dart';

class SignupController {
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

  String? defaultValidator(String? value, String errorText) {
    if (value == null || value.isEmpty) {
      return errorText;
    }

    return null;
  }

  String? validateEmail(String? email) {
    String pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

    RegExp regExp = RegExp(pattern);

    if (email == null || email.isEmpty) {
      return 'Insira o e-mail.';
    } else if (!regExp.hasMatch(email)) {
      return 'Insira um e-mail válido.';
    }

    return null;
  }

  String? validateCpf(String? cpf) {
    String pattern = r"^\d{3}\.\d{3}\.\d{3}-\d{2}$";
    RegExp regExp = RegExp(pattern);

    if (cpf == null || cpf.isEmpty) {
      return "Insira o CPF.";
    } else if (!regExp.hasMatch(cpf)) {
      return "Insira um CPF válido.";
    }

    return null;
  }

  String? validatePhoneNumber(String? phoneNumber) {
    String pattern = r"^\(\d{2}\) \d{4,5}-\d{4}$";
    RegExp regExp = RegExp(pattern);

    if (phoneNumber != null && phoneNumber.isNotEmpty && !regExp.hasMatch(phoneNumber)) {
      return "Insira um número de telefone válido.";
    }

    return null;
  }

  String? validatePassword(String? password) {
    String pattern =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}[\]:;<>,.?/~`-])[A-Za-z\d!@#$%^&*()_+{}[\]:;<>,.?/~`-]{6,10}$";
    RegExp regExp = RegExp(pattern);

    if (password == null || password.isEmpty) {
      return "Insira a senha.";
    } else if (!regExp.hasMatch(password)) {
      return "Insira uma senha válida.";
    }

    return null;
  }

  String? validateEqualPassword(String? value1, String? value2) {
    if (value1 != value2) return "As senhas não correspondem.";
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
