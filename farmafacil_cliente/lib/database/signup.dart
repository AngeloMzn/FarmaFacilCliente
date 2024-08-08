import 'dart:convert';

import 'package:farmafacil_cliente/database/database_config.dart';
import 'package:farmafacil_cliente/models/address.dart';
import 'package:farmafacil_cliente/models/user.dart';
import 'package:http/http.dart' as http;

class Signup {
  static Future<http.Response> createUser(User user, Address address) {
    var data = {
      'email': user.email.trim(),
      'name': user.name,
      'cpf': user.cpf,
      'rg': user.rg,
      'role': user.role,
      'phone': user.phoneNumber,
      'birthdate': "${user.birthdate}Z",
      'password': user.password.trim(),
      'address': {
        'uf': address.uf,
        'cep': address.cep,
        'city': address.city,
        'street': address.street,
        'number': address.number,
        'type': address.type,
        'complement': address.complement,
      }
    };

    // TODO: dá pra criar uma classe Requests e nela ter send e receive
    final response = http.post(
      Uri.parse('${DatabaseConfig.baseUrl}/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    return response;
  }
}
