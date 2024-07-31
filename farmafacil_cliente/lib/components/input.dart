import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final bool hideText;
  final String placeholder;
  final IconButton? icon;
  final TextInputType keyboardType;
  final Color iconColor;

  const Input({
    super.key,
    this.hideText = false,
    this.icon,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.iconColor = ApplicationColors.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
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
        suffixIconColor: iconColor,
      ),
    );
  }
}
