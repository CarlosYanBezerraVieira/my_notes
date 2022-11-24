import 'package:flutter/material.dart';
import 'package:mynotes/core/app_widget.dart';
import 'package:mynotes/pages/login_view.dart';
import 'package:mynotes/pages/notes_view.dart';
import 'package:mynotes/pages/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: const AppWidget(),
    routes: {
      "/login/": (context) => const LoginView(),
      "/register/": (context) => const RegisterView(),
      "/notes/": (context) => const NotesView(),
    },
  ));
}
