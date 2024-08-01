import 'package:flutter/material.dart';

class AddressController {
  final tipos = ["Residencial", "Trabalho", "Outro"];
  int? selecionado = 0;
  bool showError = false;

  String? defaultValidator(String? value, String errorText) {
    if (value == null || value.isEmpty) {
      return errorText;
    }

    return null;
  }

  bool submitForm(GlobalKey<FormState> key) {
    if (selecionado == null) {
      return true;
    }

    if (key.currentState!.validate() && selecionado != null) {
      debugPrint("válido");
    } else {
      debugPrint("não válido");
    }

    return false; 
  }
}
