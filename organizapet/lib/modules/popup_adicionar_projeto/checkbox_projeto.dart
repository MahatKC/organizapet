import 'package:flutter/material.dart';
import 'package:organizapet/modules/popup_adicionar_projeto/popup_adicionar_projeto_controller.dart';

class CheckboxProjeto extends StatefulWidget {
  final String nome_membro;
  final popupAdicionarProjetoController controller;
  const CheckboxProjeto({ Key? key, required this.nome_membro, required this.controller }) : super(key: key);

  @override
  _CheckboxProjetoState createState() => _CheckboxProjetoState();
}

class _CheckboxProjetoState extends State<CheckboxProjeto> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.controller.projetos.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CheckboxListTile(
                title: Text(widget.controller.projetos[index]),
                value: widget.controller.projetos_selecionados[index],
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.controller.projetos_selecionados[index] = newValue ?? false;
                  });
                });
          });
  }
}