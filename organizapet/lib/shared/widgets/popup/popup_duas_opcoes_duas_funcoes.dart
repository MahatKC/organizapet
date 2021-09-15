import 'package:flutter/material.dart';

class PopupDuasOpcoesDuasFuncoes extends StatelessWidget {
  final String title;
  final VoidCallback yes_callback, no_callback;
  final String message;

  const PopupDuasOpcoesDuasFuncoes(
      {Key? key,
      required this.title,
      required this.message,
      required this.yes_callback,
      required this.no_callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popup(context);
  }

  Widget popup(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            child: const Text("Sim"),
            onPressed: yes_callback
            ),
        TextButton(
          child: const Text("Não"),
          onPressed: no_callback,
        ),
      ],
    );
  }
}
