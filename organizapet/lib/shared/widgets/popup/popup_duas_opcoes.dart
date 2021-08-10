import 'package:flutter/material.dart';

class PopupDuasOpcoes extends StatelessWidget {
  final String title;
  final String message;

  const PopupDuasOpcoes({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

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
          onPressed: () => Navigator.pop(context, 'sim'),
        ),
        TextButton(
          child: const Text("Não"),
          onPressed: () => Navigator.pop(context, 'não'),
        ),
      ],
    );
  }
}