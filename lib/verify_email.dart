import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Por favor vefique seu email',
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: const Text(
                "Verificar",
                style: TextStyle(
                  color: Colors.black45,
                  decoration: TextDecoration.underline,
                ),
              )),
        ],
      ),
    );
  }
}
