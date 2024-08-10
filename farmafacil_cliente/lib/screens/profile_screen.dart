import 'package:farmafacil_cliente/database/authentication.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text("sair"),
        onPressed: () {
          Authentication.logout(context);
        },
      ),
    );
  }
}
