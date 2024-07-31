import 'package:farmafacil_cliente/theme/application_theme.dart';
import 'package:flutter/material.dart';
import 'package:farmafacil_cliente/screens/login_screen.dart';

void main() {
  runApp(const FarmaFacilCliente());
}

class FarmaFacilCliente extends StatelessWidget {
  const FarmaFacilCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmaFacil',
      theme: ApplicationThemes.defaultTheme,
      home: const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
