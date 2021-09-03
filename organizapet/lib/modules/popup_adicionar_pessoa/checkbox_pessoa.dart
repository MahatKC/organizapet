import 'package:flutter/material.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_controller.dart';

class CheckboxPessoa extends StatefulWidget {
  final String nome;
  //popupAdicionarPessoaController ctrl;

  const CheckboxPessoa({Key? key, required this.nome}) : super(key: key);

  @override
  _CheckboxPessoaState createState() => _CheckboxPessoaState();
}

class _CheckboxPessoaState extends State<CheckboxPessoa> {
  bool? check = false;
  @override
  Widget build(BuildContext context) {
    /*return ListView.builder(
      itemCount: widget.size,
      itemBuilder: (ctx, index) {*/
        return CheckboxListTile(
        title: Text(widget.nome),
        value: check,
        onChanged: (bool? newValue) {
          setState(() {
            check = newValue;
          });
        });
  }
}
