import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final bool hideText;
  final String placeholder;
  final IconButton? icon;

  const RoundedInput({super.key, this.hideText = false, this.icon, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ApplicationColors.primaryText,
      obscureText: hideText,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: ApplicationColors.primaryBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: icon,
        suffixIconColor: ApplicationColors.secondaryText,
      ),
    );
  }
}
