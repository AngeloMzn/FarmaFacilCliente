import 'package:easy_mask/easy_mask.dart';
import 'package:farmafacil_cliente/components/button.dart';
import 'package:farmafacil_cliente/components/error_text.dart';
import 'package:farmafacil_cliente/components/input.dart';
import 'package:farmafacil_cliente/controllers/address_controller.dart';
import 'package:farmafacil_cliente/enums/estados_label.dart';
import 'package:farmafacil_cliente/models/user.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressScreen extends StatefulWidget {
  final User user;
  const AddressScreen({super.key, required this.user});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cepController = TextEditingController(),
      cidadeController = TextEditingController(),
      bairroController = TextEditingController(),
      ruaController = TextEditingController(),
      numeroController = TextEditingController(),
      complementoController = TextEditingController(),
      ufController = TextEditingController();
  final addressController = AddressController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Endereço"),
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DropdownMenu<EstadosLabel>(
                        expandedInsets: EdgeInsets.zero,
                        trailingIcon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        menuHeight: 200,
                        textStyle: const TextStyle(
                          color: ApplicationColors.primaryText,
                        ),
                        menuStyle: const MenuStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(
                            ApplicationColors.primaryBackground,
                          ),
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: ApplicationColors.primaryBackground,
                        ),
                        initialSelection: EstadosLabel.values.first,
                        controller: ufController,
                        label: const Text('UF'),
                        onSelected: (EstadosLabel? estado) {
                          setState(() {
                            debugPrint(ufController.text);
                          });
                        },
                        dropdownMenuEntries: EstadosLabel.values
                            .map<DropdownMenuEntry<EstadosLabel>>(
                                (EstadosLabel estado) {
                          return DropdownMenuEntry<EstadosLabel>(
                            value: estado,
                            label: estado.nome,
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Input(
                        controller: cepController,
                        validator: (cep) {
                          return addressController.defaultValidator(
                            cep,
                            "Insira seu CEP.",
                          );
                        },
                        masks: [
                          TextInputMask(
                            mask: "99999-999",
                          ),
                        ],
                        placeholder: "CEP",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Input(
                        controller: cidadeController,
                        placeholder: "Cidade",
                        keyboardType: TextInputType.text,
                        validator: (cidade) {
                          return addressController.defaultValidator(
                            cidade,
                            "Insira a sua cidade.",
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Input(
                        controller: bairroController,
                        validator: (bairro) {
                          return addressController.defaultValidator(
                            bairro,
                            "Insira o seu bairro.",
                          );
                        },
                        placeholder: "Bairro",
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Input(
                        controller: ruaController,
                        placeholder: "Rua",
                        validator: (rua) {
                          return addressController.defaultValidator(
                            rua,
                            "Insira o nome da sua rua.",
                          );
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Input(
                        controller: numeroController,
                        placeholder: "Número",
                        keyboardType: TextInputType.number,
                        masks: [FilteringTextInputFormatter.digitsOnly],
                        validator: (numero) {
                          return addressController.defaultValidator(
                            numero,
                            "Insira o número da sua casa.",
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Tipo de Endereço",
                        style: TextStyle(
                          fontSize: 14,
                          color: ApplicationColors.secondaryText,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 7.0,
                      children: List<Widget>.generate(
                        addressController.tipos.length,
                        (int index) {
                          return ChoiceChip(
                            showCheckmark: true,
                            selectedColor: ApplicationColors.accent2,
                            backgroundColor:
                                ApplicationColors.primaryBackground,
                            label: Text(addressController.tipos[index]),
                            selected: addressController.selecionado == index,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              side: BorderSide(
                                color: ApplicationColors.primary,
                              ),
                            ),
                            onSelected: (selecionado) {
                              setState(() {
                                addressController.selecionado =
                                    selecionado ? index : null;
                              });
                            },
                          );
                        },
                      ).toList(),
                    ),
                    ErrorText(
                      showError: addressController.showError,
                      message: "Escolha um tipo de endereço.",
                    ),
                    const Divider(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Informações adicionais",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Input(
                      controller: complementoController,
                      keyboardType: TextInputType.multiline,
                      lines: 4,
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
                              addressController.showError =
                                  addressController.submitForm(
                                context,
                                _formKey,
                                ufController.text,
                                cepController.text,
                                cidadeController.text,
                                bairroController.text,
                                ruaController.text,
                                numeroController.text,
                                addressController.selecionado,
                                complementoController.text,
                                widget.user,
                              );
                            },
                          );
                        },
                        text: "Criar conta",
                        textSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
