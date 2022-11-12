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
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
        ),
        centerTitle: true,
        title: const Text(
          "Cadastro",
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
                    borderRadius: BorderRadius.circular(10)),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 8),
                child: Row(
                  children: [
                    const Text(
                      "Já possui um cadastro? ",
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
                              '/login/', (route) => false);
                        },
                        child: const Text(
                          "Fazer login",
                          style: TextStyle(
                            color: Colors.black45,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
