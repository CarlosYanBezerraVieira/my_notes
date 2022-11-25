import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/core/routes/routes.dart';

enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Suas notas",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.yellow[50],
        shadowColor: Colors.transparent,
        actions: [
          PopupMenuButton<MenuAction>(
            child: const Icon(
              Icons.more_vert,
              color: Colors.indigo,
            ),
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(login, (_) => false);
                  }
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: MenuAction.logout,
                  child: Text("Sair"),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Sair do app"),
        content: const Text("Tem certeza que desejar sair ?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "Sair",
                style: TextStyle(
                  color: Colors.black45,
                ),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                "Cancelar",
                style: TextStyle(
                  color: Colors.black45,
                ),
              )),
        ],
      );
    },
  ).then((value) => value ?? false);
}
