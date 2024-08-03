import 'dart:convert';
import 'package:farmafacil_cliente/screens/login_screen.dart';
import 'package:farmafacil_cliente/utils/login_cookie.dart';
import 'package:farmafacil_cliente/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication {
  Authentication._();

  static Future<http.Response> login(String email, String password) {
    final response = http.post(
      Uri.parse('http://localhost:3000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  static void logout(BuildContext context) {
    LoginCookie.remove();
    Navigate.navigateAndRemoveAllRoutes(context, const LoginScreen());
  }

  static Future<bool> isLoggedIn() {
    return Future.value(true);
  }
}
