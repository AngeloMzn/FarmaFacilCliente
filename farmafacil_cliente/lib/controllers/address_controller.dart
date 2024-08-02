import 'package:farmafacil_cliente/models/address.dart';
import 'package:farmafacil_cliente/models/user.dart';
import 'package:farmafacil_cliente/screens/home_screen.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
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

  bool submitForm(
    BuildContext context,
    GlobalKey<FormState> key,
    String uf,
    String cep,
    String cidade,
    String bairro,
    String rua,
    String numero,
    int? tipoEscolhido,
    String complemento,
    User user,
  ) {
    if (selecionado == null) {
      return true;
    }

    final address = Address(
      uf: uf,
      cep: cep,
      cidade: cidade,
      bairro: bairro,
      rua: rua,
      numero: numero,
      tipo: tipos[tipoEscolhido ?? 0],
      complemento: complemento,
    );

    if (key.currentState!.validate()) {
      // TO-DO: chamar authenticate
      Navigate.to(context, const HomeScreen());
    }

    return false;
  }
}
