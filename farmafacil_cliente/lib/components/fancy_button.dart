import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final String labelText;
  final Function onTap;
  const FancyButton({
    super.key,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        onTap();
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ApplicationColors.primaryBackground,
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 14),
          height: 56,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: const TextStyle(
                fontSize: 16,
                color: ApplicationColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
