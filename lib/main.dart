import 'package:flutter/material.dart';
import 'package:mynotes/app_widget.dart';
import 'package:mynotes/pages/login_page.dart';
import 'package:mynotes/pages/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: const AppWidget(),
    routes: {
      "/login/": (context) => const LoginPage(),
      "/register/": (context) => const RegisterPage(),
    },
  ));
}
