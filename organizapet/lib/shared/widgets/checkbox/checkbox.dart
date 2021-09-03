import 'package:flutter/material.dart';

class CheckBoxTarefaCritica extends StatefulWidget {
  const CheckBoxTarefaCritica({ Key? key }) : super(key: key);
   
  @override
  _CheckBoxTarefaCriticaState createState() => _CheckBoxTarefaCriticaState();
}

class _CheckBoxTarefaCriticaState extends State<CheckBoxTarefaCritica> {
  bool tarefaCritica = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text("Tarefa Critica"),
      value: tarefaCritica, onChanged: (bool? value) {
      setState(() {
        tarefaCritica = true;
      });
      
    });
  }
}