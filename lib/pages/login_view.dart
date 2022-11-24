import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    return Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Login",
            style: TextStyle(color: Colors.black54),
          ),
          backgroundColor: Colors.yellow[50],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
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
                        height: 16,
                      ),
                      TextButton(
                          onPressed: () async {
                            final email = _email.text;
                            final password = _password.text;

                            try {
                              final userCredential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              devtools.log(userCredential.toString());
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                devtools.log('Usuário não encontrado');
                              } else if (e.code == 'wrong-password') {
                                devtools.log('Senha incorreta');
                              } else {
                                devtools.log('ERRO');
                                devtools.log(e.code);
                              }
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black45,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 8),
                  child: Row(
                    children: [
                      const Text(
                        "Não possui cadastro? ",
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      TextButton(
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: MaterialStateProperty.all(Size.zero),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/register/', (route) => false);
                          },
                          child: const Text(
                            "Cadastra-se",
                            style: TextStyle(
                              color: Colors.black45,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}
