import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("sair"),
          onPressed: () {
            debugPrint("sair");
          },
        ),
      ),
    );
  }
}
