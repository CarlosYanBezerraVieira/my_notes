import 'package:flutter/material.dart';

Future<bool> showLogOutDialog(BuildContext context, String textErro) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Erro"),
        content: Text(textErro),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "Ok",
                style: TextStyle(
                  color: Colors.black45,
                ),
              )),
        ],
      );
    },
  ).then((value) => value ?? false);
}
