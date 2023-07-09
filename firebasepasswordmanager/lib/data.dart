import 'package:flutter/material.dart';
import 'main.dart';
import 'p0_after_login.dart';

class LoginInfo {
  String site;
  String username;
  String password;

  LoginInfo(this.site, this.username, this.password);

  toJson() {
    return {
      "site": site,
      "username": username,
      "password": password,
    };
  }
}

var appNavRoutes = <String, WidgetBuilder>{
  'login': (context) => const MyHomePage(), // in main.dart
  'passwords': (context) => const PasswordManagerPage(),
};