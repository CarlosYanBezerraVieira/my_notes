import 'package:flutter/material.dart';
import 'package:mynotes/core/app_widget.dart';
import 'package:mynotes/core/routes/routes.dart';
import 'package:mynotes/pages/login_view.dart';
import 'package:mynotes/pages/notes_view.dart';
import 'package:mynotes/pages/register_view.dart';
import 'package:mynotes/verify_email.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: const AppWidget(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const VerifyEmail(),
    },
  ));
}
