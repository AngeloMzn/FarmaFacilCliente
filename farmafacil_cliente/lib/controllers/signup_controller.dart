import 'package:farmafacil_cliente/models/user.dart';
import 'package:farmafacil_cliente/screens/address_screen.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/material.dart';

class SignupController {
  bool hidePassword = true;
  IconData passwordIcon = Icons.visibility_off;
  bool showError = false;
  DateTime? chosenDate;
  String datePickerLabel = "Data de nascimento";

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

    if (phoneNumber != null &&
        phoneNumber.isNotEmpty &&
        !regExp.hasMatch(phoneNumber)) {
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

  Future<String> pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2024, 12, 31),
    );

    if (chosenDate != null && date == null) {
      return "${chosenDate!.day}/${chosenDate!.month}/${chosenDate!.year}";
    } else if (date != null) {
      chosenDate = date;
      return "${date.day}/${date.month}/${date.year}";
    }

    return "Data de nascimento";
  }

  bool submitForm(
    GlobalKey<FormState> key,
    BuildContext context,
    String nome,
    String? telefone,
    String email,
    String cpf,
    String? rg,
    String senha,
  ) {
    final user = User(nome, telefone, email, cpf, rg, senha);

    if (chosenDate == null) {
      return true;
    } else {
      if (key.currentState!.validate()) {
        Navigate.to(context, AddressScreen(user: user));
      }
    }

    return false;
  }
}
