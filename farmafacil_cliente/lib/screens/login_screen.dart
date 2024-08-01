import 'package:farmafacil_cliente/components/button.dart';
import 'package:farmafacil_cliente/components/input.dart';
import 'package:farmafacil_cliente/controllers/login_controller.dart';
import 'package:farmafacil_cliente/controllers/signup_controller.dart';
import 'package:farmafacil_cliente/screens/signup_screen.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final SignupController signupController = SignupController();
  final TextEditingController emailController = TextEditingController(),
      senhaController = TextEditingController();
  final loginController = LoginController();

  @override
  void dispose() {
    super.dispose();
  }

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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Input(
                        controller: emailController,
                        placeholder: "E-mail",
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          return loginController.validateEmail(email);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Input(
                          controller: senhaController,
                          validator: (senha) {
                            return loginController.validatePassword(senha);
                          },
                          placeholder: "Senha",
                          hideText: loginController.hidePassword,
                          icon: loginController.passwordIcon,
                          onIconTap: () {
                            setState(() {
                              loginController.togglePasswordVisibility();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Button(
                          height: 44,
                          onPress: () {
                            loginController.submitForm(_formKey);
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
