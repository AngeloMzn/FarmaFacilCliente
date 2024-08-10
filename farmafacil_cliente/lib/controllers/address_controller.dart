import 'package:farmafacil_cliente/database/signup.dart';
import 'package:farmafacil_cliente/models/address.dart';
import 'package:farmafacil_cliente/models/user.dart';
import 'package:farmafacil_cliente/screens/main_screen.dart';
import 'package:farmafacil_cliente/utils/login_cookie.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class AddressController {
  final types = ["Residencial", "Trabalho", "Outro"];
  int? selected = 0;
  bool showError = false;

  String? defaultValidator(String? value, String errorText) {
    if (value == null || value.isEmpty) {
      return errorText;
    }

    return null;
  }

  String? validateCep(String? cep) {
    String pattern = r"^\d{5}-\d{3}$";
    RegExp regExp = RegExp(pattern);

    if (cep == null || cep.isEmpty) {
      return "Insira o CEP.";
    } else if (!regExp.hasMatch(cep)) {
      return "Insira um CEP válido.";
    }

    return null;
  }

  bool submitForm(
    BuildContext context,
    GlobalKey<FormState> key,
    String uf,
    String cep,
    String city,
    String bairro,
    String street,
    String number,
    int? chosenType,
    String complement,
    User user,
  ) {
    if (selected == null) {
      return true;
    }

    final address = Address(
      uf: uf,
      cep: cep,
      city: city,
      bairro: bairro,
      street: street,
      number: number,
      type: types[chosenType ?? 0],
      complement: complement,
    );

    if (key.currentState!.validate()) {
      final progress = ProgressHUD.of(context);
      progress?.showWithText('Criando...');

      FocusManager.instance.primaryFocus?.unfocus();
      Signup.createUser(user, address).then((requestResponse) {
        progress?.dismiss();

        debugPrint(requestResponse.body);
        debugPrint(address.toString());
        if (requestResponse.statusCode == 200) {
          LoginCookie.save();
          Navigate.navigateAndRemoveAllRoutes(context, const MainScreen());
        } else {
          const snackBar = SnackBar(
            content: Text(
              "Erro no cadastro!",
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
    return false;
  }
}
