import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double height, textSize;
  final Function? onPress;
  final String text;

  const Button({super.key, required this.height, required this.onPress, required this.text, this.textSize = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll<Color>(
            ApplicationColors.primary,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          onPress!();
        },
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
