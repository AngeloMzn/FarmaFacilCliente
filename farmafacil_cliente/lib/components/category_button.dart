import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final Icon icon;
  const CategoryButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      iconSize: 50,
      icon: icon,
      style: IconButton.styleFrom(
          backgroundColor: ApplicationColors.primaryLight,
          side: const BorderSide(
            color: ApplicationColors.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onPressed: () {},
    );
  }
}
