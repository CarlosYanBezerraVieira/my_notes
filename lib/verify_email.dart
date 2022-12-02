import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/core/routes/routes.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            const Text(
              'Enviamos um email de verificação para você,\n por favor verifique sua conta.',
              style: TextStyle(
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Caso não tenha recebido email:',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: MaterialStateProperty.all(Size.zero),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(left: 2)),
                        ),
                        onPressed: () async {
                          final user = FirebaseAuth.instance.currentUser;
                          await user?.sendEmailVerification();
                        },
                        child: const Text(
                          "Clique aqui",
                          style: TextStyle(
                            color: Colors.black45,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
                TextButton(
                    style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.all(Size.zero),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(top: 16)),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();

                      if (!mounted) {
                        log('erro no mounted');
                        return;
                      }
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (_) => false,
                      );
                    },
                    child: const Text(
                      "Sair da conta",
                      style: TextStyle(
                        color: Colors.black45,
                        decoration: TextDecoration.underline,
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
