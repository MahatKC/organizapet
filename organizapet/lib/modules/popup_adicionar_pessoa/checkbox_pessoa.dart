import 'package:flutter/material.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_controller.dart';

class CheckboxPessoa extends StatefulWidget {
  //final String nome;
  final List<String> petianos_names;
  final List<bool> petianos_membros;
  //popupAdicionarPessoaController ctrl;

  const CheckboxPessoa(
      {Key? key, required this.petianos_names, required this.petianos_membros})
      : super(key: key);

  @override
  _CheckboxPessoaState createState() => _CheckboxPessoaState();
}

class _CheckboxPessoaState extends State<CheckboxPessoa> {

  @override
  Widget build(BuildContext context) {
    print("checkbox foi");
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.petianos_names.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CheckboxListTile(
              title: Text(widget.petianos_names[index]),
              value: widget.petianos_membros[index],
              onChanged: (bool? newValue) {
                setState(() {
                  widget.petianos_membros[index] = newValue ?? false;
                });
              });
        });
  }
}
