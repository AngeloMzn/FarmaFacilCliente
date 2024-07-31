import 'package:farmafacil_cliente/components/button.dart';
import 'package:farmafacil_cliente/components/input.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.goBack(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Junte-se a nós!",
                  style: TextStyle(
                    color: ApplicationColors.primary,
                    fontSize: 30,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Um jeito fácil de comprar",
                  style: TextStyle(
                    color: ApplicationColors.primary,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "Nome completo",
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "Telefone",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "E-mail",
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "Endereço",
                          keyboardType: TextInputType.streetAddress,
                          icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_home,
                            ),
                            color: ApplicationColors.primary,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "CPF",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "RG",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "Senha",
                          hideText: true,
                          icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                          iconColor: ApplicationColors.primary,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Entre 6 a 10 caracteres, deve conter ao menos uma letra maiúscula, uma minúscula e um caractere especial",
                          style: TextStyle(
                            color: ApplicationColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          placeholder: "Confirme a senha",
                          hideText: true,
                          icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                          iconColor: ApplicationColors.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Button(
                          height: 60,
                          onPress: () {
                            debugPrint("hello");
                          },
                          text: "Criar conta",
                          textSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
