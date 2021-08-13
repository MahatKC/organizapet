import 'package:flutter/material.dart';

class PopupUmaOpcao extends StatelessWidget {
  final String title;
  final VoidCallback? after_func;
  final String message;

  const PopupUmaOpcao(
      {Key? key, required this.title, required this.message, this.after_func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popup(context);
  }

  Widget popup(BuildContext context) {
    void pop_widget() {
      Navigator.pop(context, 'ok');
    }
    
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: after_func ?? pop_widget,
        ),
      ],
    );
  }

  
}
