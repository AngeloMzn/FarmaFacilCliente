import 'package:farmafacil_cliente/screens/main_screen.dart';
import 'package:farmafacil_cliente/theme/application_theme.dart';
import 'package:farmafacil_cliente/utils/login_cookie.dart';
import 'package:flutter/material.dart';
import 'package:farmafacil_cliente/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? loggedIn = await LoginCookie.getLoginState();
  runApp(FarmaFacilCliente(loggedIn: loggedIn ?? false));
}

class FarmaFacilCliente extends StatelessWidget {
  final bool loggedIn;
  const FarmaFacilCliente({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmaFacil',
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt"),
      ],
      theme: ApplicationThemes.defaultTheme,
      home: Scaffold(
        body: loggedIn? const MainScreen() : const LoginScreen(),
      ),
    );
  }
}
