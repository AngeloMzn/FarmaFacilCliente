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
      telefoneController = TextEditingController(),
      emailController = TextEditingController(),
      cpfController = TextEditingController(),
      rgController = TextEditingController(),
      senhaController = TextEditingController(),
      senhaRepetidaController = TextEditingController();
  final signupControllerUm = SignupController(),
      signupControllerDois = SignupController();

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
                            return signupControllerUm.defaultValidator(
                              nome,
                              "Insira seu nome.",
                            );
                          },
                          placeholder: "Nome completo",
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      FancyButton(
                        labelText: signupControllerUm.datePickerLabel,
                        onTap: () {
                          signupControllerUm.pickDate(context).then((date) {
                            setState(() {
                              signupControllerUm.datePickerLabel = date;
                            });
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ErrorText(
                          showError: signupControllerUm.showError,
                          message: "Selecione uma data de nascimento.",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: telefoneController,
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
                            return signupControllerUm.validatePhoneNumber(
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
                            return signupControllerUm.validateEmail(email);
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
                            return signupControllerUm.validateCpf(
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Input(
                          controller: senhaController,
                          placeholder: "Senha",
                          hideText: signupControllerUm.hidePassword,
                          icon: signupControllerUm.passwordIcon,
                          onIconTap: () {
                            setState(() {
                              signupControllerUm.togglePasswordVisibility();
                            });
                          },
                          iconColor: ApplicationColors.primary,
                          validator: (senha) {
                            return signupControllerUm.validatePassword(senha);
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
                          controller: senhaRepetidaController,
                          placeholder: "Confirme a senha",
                          hideText: signupControllerDois.hidePassword,
                          icon: signupControllerDois.passwordIcon,
                          onIconTap: () {
                            setState(() {
                              signupControllerDois.togglePasswordVisibility();
                            });
                          },
                          iconColor: ApplicationColors.primary,
                          validator: (senhaRepetida) {
                            return signupControllerUm.validateEqualPassword(
                              senhaRepetida,
                              senhaController.text,
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
                            setState(() {
                              signupControllerUm.showError =
                                  signupControllerUm.submitForm(
                                _formKey,
                                context,
                                nomeController.text,
                                telefoneController.text,
                                emailController.text,
                                cpfController.text,
                                rgController.text,
                                senhaController.text,
                              );
                            });
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
