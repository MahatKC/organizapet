import 'package:flutter/material.dart';

class PopupDuasOpcoes extends StatelessWidget {
  final String title;
  final VoidCallback yes_callback;
  final String message;

  const PopupDuasOpcoes(
      {Key? key,
      required this.title,
      required this.message,
      required this.yes_callback})
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
              //return Navigator.pop(context, 'sim');
            ),
        TextButton(
          child: const Text("Não"),
          onPressed: () => Navigator.pop(context, 'não'),
        ),
      ],
    );
  }
}
