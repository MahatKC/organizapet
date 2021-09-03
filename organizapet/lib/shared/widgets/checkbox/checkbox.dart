import 'package:flutter/material.dart';

class CheckBoxTarefaCritica extends StatefulWidget {
  const CheckBoxTarefaCritica({Key? key}) : super(key: key);

  @override
  _CheckBoxTarefaCriticaState createState() => _CheckBoxTarefaCriticaState();
}

class _CheckBoxTarefaCriticaState extends State<CheckBoxTarefaCritica> {
  bool? tarefaCritica = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 100, left: 100),
      child: CheckboxListTile(
          title: Text("Tarefa Crítica"),
          value: tarefaCritica,
          onChanged: (bool? value) {
            setState(() {
              tarefaCritica = value;
            });
          }),
    );
  }
}
