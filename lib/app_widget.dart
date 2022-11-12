import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/pages/login_page.dart';
import 'package:mynotes/verify_email.dart';

import 'firebase_options.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print('email verificado');
              } else {
                return const VerifyEmail();
              }
            } else {
              return LoginPage();
            }
            return Text('done');

          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
