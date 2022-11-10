import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController(text: '');
    _password = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                hintText: 'Senha',
              ),
              controller: _password,
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;

                  try {
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    print(userCredential);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('Senha muito fraca');
                    } else if (e.code == 'email-already-in-use') {
                      print('O email já está sendo usado');
                    } else if (e.code == 'invalid-email') {
                      print('Email inválido');
                    } else {
                      print("ERRO");
                      print(e.code);
                    }
                  }
                },
                child: const Text(
                  "Cadastra-se",
                  style: TextStyle(
                    color: Colors.black45,
                    decoration: TextDecoration.underline,
                  ),
                )),
          ],
        ));
  }
}
