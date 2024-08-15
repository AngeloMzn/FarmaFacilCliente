import 'package:easy_mask/easy_mask.dart';
import 'package:farmafacil_cliente/components/button.dart';
import 'package:farmafacil_cliente/components/error_text.dart';
import 'package:farmafacil_cliente/components/fancy_button.dart';
import 'package:farmafacil_cliente/components/input.dart';
import 'package:farmafacil_cliente/controllers/signup_controller.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      emailController = TextEditingController(),
      cpfController = TextEditingController(),
      rgController = TextEditingController(),
      passwordController = TextEditingController(),
      repeatPasswordController = TextEditingController();
  final signupControllerOne = SignupController(),
      signupControllerTwo = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados básicos"),
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: nomeController,
                          validator: (nome) {
                            return signupControllerOne.defaultValidator(
                              nome,
                              "Insira seu nome.",
                            );
                          },
                          placeholder: "Nome completo",
                          keyboardType: TextInputType.name,
                          charLimit: 100,
                        ),
                      ),
                      FancyButton(
                        labelText: signupControllerOne.datePickerLabel,
                        onTap: () {
                          signupControllerOne
                              .pickDate(context)
                              .then((dateResult) {
                            setState(() {
                              signupControllerOne.datePickerLabel = dateResult;
                            });
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ErrorText(
                          showError: signupControllerOne.showError,
                          message: "Selecione uma data de nascimento.",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: phoneNumberController,
                          placeholder: "Telefone",
                          keyboardType: TextInputType.number,
                          masks: [
                            TextInputMask(
                              mask: [
                                "(99) 9999-9999",
                                "(99) 99999-9999",
                              ],
                            ),
                          ],
                          validator: (phoneNumber) {
                            return signupControllerOne.validatePhoneNumber(
                              phoneNumber,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: emailController,
                          validator: (email) {
                            return signupControllerOne.validateEmail(email);
                          },
                          placeholder: "E-mail",
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: cpfController,
                          placeholder: "CPF",
                          validator: (cpf) {
                            return signupControllerOne.validateCpf(
                              cpf,
                            );
                          },
                          keyboardType: TextInputType.number,
                          masks: [
                            TextInputMask(
                              mask: "999.999.999-99",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: rgController,
                          placeholder: "RG",
                          keyboardType: TextInputType.number,
                          masks: [FilteringTextInputFormatter.digitsOnly],
                          validator: (rg) {
                            return signupControllerOne.defaultValidator(
                              rg,
                              "Insira o seu RG.",
                            );
                          },
                          charLimit: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: passwordController,
                          placeholder: "Senha",
                          hideText: signupControllerOne.hidePassword,
                          icon: signupControllerOne.passwordIcon,
                          onIconTap: () {
                            setState(() {
                              signupControllerOne.togglePasswordVisibility();
                            });
                          },
                          iconColor: ApplicationColors.primary,
                          validator: (senha) {
                            return signupControllerOne.validatePassword(senha);
                          },
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
                          controller: repeatPasswordController,
                          placeholder: "Confirme a senha",
                          hideText: signupControllerTwo.hidePassword,
                          icon: signupControllerTwo.passwordIcon,
                          onIconTap: () {
                            setState(() {
                              signupControllerTwo.togglePasswordVisibility();
                            });
                          },
                          iconColor: ApplicationColors.primary,
                          validator: (senhaRepetida) {
                            return signupControllerOne.validateEqualPassword(
                              senhaRepetida,
                              passwordController.text,
                            );
                          },
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
                            setState(
                              () {
                                signupControllerOne.showError =
                                    signupControllerOne.submitForm(
                                  _formKey,
                                  context,
                                  nomeController.text,
                                  phoneNumberController.text,
                                  emailController.text,
                                  cpfController.text,
                                  rgController.text,
                                  passwordController.text,
                                );
                              },
                            );
                          },
                          text: "Continue",
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
