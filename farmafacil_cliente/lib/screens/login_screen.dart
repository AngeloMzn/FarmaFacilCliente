import 'package:farmafacil_cliente/components/button.dart';
import 'package:farmafacil_cliente/components/input.dart';
import 'package:farmafacil_cliente/screens/signup_screen.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              "assets/logo.png",
              scale: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Olá!",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 36,
                      color: ApplicationColors.primary,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Comece preenchendo os campos abaixo:",
                      style: TextStyle(
                        fontSize: 14,
                        color: ApplicationColors.secondaryText,
                      ),
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Input(
                        placeholder: "E-mail",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Input(
                          placeholder: "Senha",
                          hideText: true,
                          icon: IconButton(
                            onPressed: () {
                              debugPrint("Hi");
                            },
                            icon: const Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Button(
                          height: 44,
                          onPress: () {
                            debugPrint("hi");
                          },
                          text: "Entre",
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Não tem uma conta? ",
                          style: TextStyle(
                            color: ApplicationColors.primaryText,
                          ),
                        ),
                        TextSpan(
                          text: "Crie.",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigate.to(context, const SignupScreen());
                            },
                          style: const TextStyle(
                            color: ApplicationColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
