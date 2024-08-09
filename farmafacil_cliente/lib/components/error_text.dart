import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final bool showError;
  final String message;
  const ErrorText({
    super.key,
    required this.showError,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (showError) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 10),
        child: Text(
          message,
          style: const TextStyle(
            color: ApplicationColors.error,
            fontSize: 12,
          ),
        ),
      );
    }

    return Container();
  }
}
