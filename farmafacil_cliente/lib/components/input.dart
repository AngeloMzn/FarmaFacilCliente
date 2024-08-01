import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final bool hideText;
  final String? placeholder;
  final IconData? icon;
  final Function? onIconTap;
  final TextInputType keyboardType;
  final Color iconColor;
  final List<TextInputFormatter>? masks;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final int lines;

  const Input({
    super.key,
    this.hideText = false,
    this.icon,
    this.placeholder,
    this.keyboardType = TextInputType.text,
    this.iconColor = ApplicationColors.secondaryText,
    this.masks,
    this.validator,
    required this.controller,
    this.lines = 1,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: ApplicationColors.primaryText,
      obscureText: hideText,
      maxLines: lines,
      inputFormatters: masks,
      style: const TextStyle(
        color: ApplicationColors.primaryText,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: ApplicationColors.primaryBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide.none,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 60,
          minHeight: 60,
        ),
        suffixIcon: icon == null
            ? null
            : Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onTap: () {
                    onIconTap!();
                  },
                  child: Icon(icon),
                ),
              ),
        suffixIconColor: iconColor,
      ),
    );
  }
}
