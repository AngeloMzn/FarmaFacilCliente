import 'package:shared_preferences/shared_preferences.dart';

class LoginCookie {
  LoginCookie._();

  static void save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged-in', true);
  }

  static Future<bool?> getLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool('logged-in');

    return result;
  }

  static void remove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('logged-in');
  }
}
