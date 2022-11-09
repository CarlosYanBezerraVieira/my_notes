import 'package:flutter/material.dart';
import 'package:mynotes/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}
