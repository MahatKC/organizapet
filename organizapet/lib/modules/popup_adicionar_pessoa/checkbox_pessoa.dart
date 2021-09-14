import 'package:flutter/material.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_controller.dart';

class CheckboxPessoa extends StatefulWidget {
  final String nome_projeto;
  final popupAdicionarPessoaController controller;

  const CheckboxPessoa(
      {Key? key, required this.nome_projeto, required this.controller})
      : super(key: key);

  @override
  _CheckboxPessoaState createState() => _CheckboxPessoaState();
}

class _CheckboxPessoaState extends State<CheckboxPessoa> {
  @override
  Widget build(BuildContext context) {
    if (widget.nome_projeto == "") {
      return Text("Erro. Insira o nome do projeto primeiro e tente novamente.");
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.controller.petianos_names.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CheckboxListTile(
                title: Text(widget.controller.petianos_names[index]),
                value: widget.controller.petianos[index],
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.controller.petianos[index] = newValue ?? false;
                  });
                });
          });
    }
  }
}
