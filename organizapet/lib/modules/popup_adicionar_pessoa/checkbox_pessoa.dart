import 'package:flutter/material.dart';

class CheckboxPessoa extends StatefulWidget {
  final String nome_projeto;
  final List<String> petianos_names;
  final List<bool> petianos_membros;

  const CheckboxPessoa(
      {Key? key,
      required this.petianos_names,
      required this.petianos_membros,
      required this.nome_projeto})
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
