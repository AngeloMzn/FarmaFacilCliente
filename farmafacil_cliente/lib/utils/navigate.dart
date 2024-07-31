import 'package:flutter/material.dart';

class Navigate {
  Navigate._();

  static void to(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
